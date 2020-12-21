# GeneticAlgorithmMATLAB
## Description
Implementation of the genetic algorithm (without mutations) for solving such task, as finding maximum of functional dependency, 
using OOP in [MATLAB](https://www.mathworks.com/products/matlab.html).
## Realization
The main algorithm is described in *`Genetic.m`* file, which contains *`GeneticAlgorithm`* function:
```matlab
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
```
So, you can see that we have those next steps of the algorithm:
1. Create and sort [*start population*](https://github.com/YarKa03Coder/GeneticAlgorithmMATLAB/blob/f9870f5be70c7c9f426308481fbb07f739aac204/Generation.m#L5-L18).
2. Check *criteria* option. `abs(Z_last-Z_pre_last) < obj.eps) || (obj.iterations <= 0`
3. Create and sort [*new population*](https://github.com/YarKa03Coder/GeneticAlgorithmMATLAB/blob/f9870f5be70c7c9f426308481fbb07f739aac204/Generation.m#L20-L44), based on previous one.

By the way, the same problem statement was solved by [*Coordinate descent method*](https://github.com/YarKa03Coder/CoordinateDescentMATLAB).
## Preview
![Alt Text](/images/gif_demonstration.gif)
