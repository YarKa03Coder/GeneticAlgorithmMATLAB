classdef Genetic < handle
    
    properties
        N = 200; % amount of population
        iterations = 200; % number of iterations
        eps = 0.0001; % Search accurancy
        fitnessFunction = @(x,y) sin(x - 2.5).*sin(y - 1.5); % Functional dependence
    end
    
    methods
        
        function set.iterations(obj, value)
            obj.iterations = value;
        end
        
        function population = GeneticAlgorithm(obj)
            
            population = Generation.CreateStartPopulation(obj.N);
            Generation.SortGeneration(population, obj.fitnessFunction);
            
            while true
    
                Z_last = obj.fitnessFunction(population.x(end),population.y(end));
                Z_pre_last = obj.fitnessFunction(population.x(end-1), population.y(end-1));
    
                if (abs(Z_last-Z_pre_last) < obj.eps) || (obj.iterations <= 0) % stop (search) criteria
                    break;
                end
    
                obj.iterations = obj.iterations - 1;
                population = Generation.CreateGeneration(population);
                population = Generation.SortGeneration(population, obj.fitnessFunction);
            end
        end
        
    end
end