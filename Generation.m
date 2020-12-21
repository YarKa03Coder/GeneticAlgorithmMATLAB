classdef Generation
    
    methods(Static)
        
        function [population] = CreateStartPopulation(N)
            %CreateStartPopulation Generating start population of inputted size
            
            population = struct('x', zeros(1,N), 'y', zeros(1,N), 'gen', zeros(1,N));
            populationSize = size(population.x, 2);
            
            for i = 1 : populationSize
                genom = uint32(randi([0, intmax('uint32')], 1, 1));
                [x, y] = Point.CreateGeneticPoint(genom);
                population.x(i) = x; % x-coordinate
                population.y(i) = y; % y-coordinate
                population.gen(i) = genom; % integer value of point, which was used to generate coordinates' values
            end
        end
        
        function [NewPopulation] = CreateGeneration(population)
            %CreateGeneration Creating new generation from previous one
            
            populationSize = size(population.x, 2);
            NewPopulation = struct('x', zeros(1, populationSize), ...
                                   'y', zeros(1, populationSize), ... 
                                   'gen', zeros(1, populationSize));
            
            for i = 1 : populationSize
                
                index1 = randi([1, populationSize], 1, 1);
                index2 = randi([1, populationSize], 1, 1);
       
                genomFirst = population.gen(index1);
                genomSecond = population.gen(index2);
       
                mask = bitshift(bitcmp(uint32(0)),  uint32(randi([1, 32], 1, 1)));
                childGenom = bitor(bitand(genomFirst, mask), bitand(genomSecond, bitcmp(mask)));
                [x, y] = Point.CreateGeneticPoint(childGenom); % child coordinates
       
                NewPopulation.x(i) = x; 
                NewPopulation.y(i) = y;
                NewPopulation.gen(i) = childGenom; 
            end
        end
        
        function [population] = SortGeneration(population, fitnessFunction)
            %SortGeneration Sort population based on fitnessFunction's values
            
            populationSize = size(population.x, 2);
            
            List = zeros([populationSize, 2]);
            sorted_population = struct('x', zeros(1,populationSize), ...
                                        'y', zeros(1,populationSize), ...
                                        'gen', zeros(1,populationSize));

            j = 1;
            for i = 1 : populationSize
                List(j, :) = [fitnessFunction(population.x(i), population.y(i)), i];
                j = j + 1;
            end
            List = sortrows(List, 1);

            for i = 1 : size(List, 1)
                [sorted_population.x(i), sorted_population.y(i), sorted_population.gen(i)] = ...
                deal(population.x(List(i, 2)), population.y(List(i, 2)), population.gen(List(i, 2)));
            end

            population = sorted_population;
        end
  
    end
end