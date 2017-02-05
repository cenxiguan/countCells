% Name: R. Guan
% Email: tianbao971@gmail.com
% Date: Feb. 4, 2017
% Description: This program describes some expressions in MATLAB
% Bug: none


% Create a variable ftemp to store a temperature in degrees Fahrenheit 
% (F). Convert this to degrees Celsius (C) and store the result in a 
% variable ctemp. The conversion factor is C = (F - 32) * 5/9.

ftemp = input('Enter a temperature in degree Fahrenheit (F): ');
ctemp = (ftemp - 32) * 5 / 9;
fprintf('Temperature %.2f Fahrenheit is equal to %.2f Celsius. \n\n', ftemp, ctemp);


% The combined resistance RT of three resistors R1, R2, and R3 in 
% parallel is given by 
% RT = 1 / ( ( 1/R1) + ( 1/R2) + ( 1/R3) )
% Create variables for the three resistors and store values in each, and 
% then calculate the combined resistance.

resistor1 = input ('Enter the resistance for the first resistor (R1): ');
resistor2 = input ('Enter the resistance for the second resistor (R2): ');
resistor3 = input ('Enter the resistance for the third resistor (R3): ');
combined_resistance = 1 / ( ( 1/resistor1) + ( 1/resistor2) + ( 1/resistor3) );
fprintf('The combined resistance RT of these three resistors R1, R2 and R3 in parallel is %f.\n\n', combined_resistance);


% In special relativity, the Lorentz factor is a number that describes 
% the effect of speed on various physical properties when the speed is 
% significant relative to the speed of light. Mathematically, the Lorentz 
% factor is given as:
% Gamma ? 1 ? sqrt(1 - V^2/C^2) 
% Use 3 X 10^8 m/s for the speed of light, c. Create variables for c and 
% the speed v and from them a variable lorentz for the Lorentz factor.

relative_vel = input('Enter the relative velocity: ');
c = 3e8;
lorentz = 1 / sqrt(1 - ( relative_vel.^2 / c.^2));
fprintf('When the relative velocity is %d, the Lorentz factor is %f.\n\n', relative_vel, lorentz);


% An environmental engineer has determined that the cost C of a 
% containment tank will be based on the radius r of the tank:
% C = 32430 / r + 428pir
% Create a variable for the radius, and then for the cost.

tank_radius = input('Enter the radius of the tank: ');
cost = 32430 / tank_radius + 428 * pi * tank_radius;
fprintf('The cost of a tank that its radius is %.2f is %.2f\n\n', tank_radius, cost);


