clear; clc;
instance = Genetic;
population = GeneticAlgorithm(instance);

disp(instance); % properties of instance

figure;
[meshX, meshY] = meshgrid(-5:0.5:5);
mesh(meshX, meshY, instance.fitnessFunction(meshX, meshY));
hold on
    scatter3(population.x, population.y, ...
    instance.fitnessFunction(population.x, population.y), '*');
hold off

disp(['X = ', num2str(population.x(end)), ... 
    ' Y = ', num2str(population.y(end)), ... 
    ' Z = ', num2str(instance.fitnessFunction(population.x(end),population.y(end)))]);