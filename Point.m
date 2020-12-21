classdef Point
    
    properties(Constant)
         MIN = -5;
         MAX = 5;
         SHIFT = 16;
    end
    
    methods(Static)
        function [x, y] = CreateGeneticPoint(genom)
            %CreateGeneticPoint Returns [x, y] values of point from inputted genom
            
            ConvertInt16ToDouble = @(max, min, number) double(number).*(max - min)./double(intmax('uint16')) + min;
            
            xBits = bitand(bitshift(genom, -Point.SHIFT), uint32(intmax('uint16')));
            yBits = bitand(genom, uint32(intmax('uint16')));
            
            x = ConvertInt16ToDouble(Point.MAX, Point.MIN, xBits);
            y = ConvertInt16ToDouble(Point.MAX, Point.MIN, yBits);
        end
    end
end