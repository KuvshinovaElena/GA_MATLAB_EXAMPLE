% https://www.mathworks.com/help/gads/ga.html
% https://www.mathworks.com/help/gads/genetic-algorithm-options.html
% https://www.mathworks.com/help/gads/gaoptimset.html

BOUNDS = [
-4 4;
-4 4
];  %����������� �� ������������ ������
nVar = 2;   %����� ��������� ���������� ������� �������
options = gaoptimset('PopulationSize', 10, 'Generations', 10);
% default:
% �������� ������� ���������: 
%   'CreationFcn' = @gacreationuniform  - ��������� ����������� �������������
% ����� ������ ���������� ����� ������: 
%   'EliteCount' = '0.05*PopulationSize'
% ���� ���������� ���������:
%   'CrossoverFraction' = 0.8
% ������� ��������������� �������-������:
%   'FitnessScalingFcn' = @fitscalingrank
%   Rank, scales the raw scores based on the rank of each individual instead of its score.
% ������� ��������:
%   'SelectionFcn' = @selectionstochunif
%   Stochastic uniform, lays out a line in which each parent corresponds to a section of the line of length proportional to its scaled value. The algorithm moves along the line in steps of equal size. At each step, the algorithm allocates a parent from the section it lands on. The first step is a uniform random number less than the step size.
% ������� ����������: 
%   'CrossoverFcn' = @crossoverscattered
%   �reates a random binary vector and selects the genes where the vector is a 1 from the first parent, and the genes where the vector is a 0 from the second parent, and combines the genes to form the child.
% ������� �������:
%   'MutationFcn' = {{@mutationgaussian 1  1}}
%   Gaussian, adds a random number taken from a Gaussian distribution with mean 0 to each entry of the parent vector. The standard deviation of this distribution is determined by the parameters Scale and Shrink, which are displayed when you select Gaussian, and by the Initial range setting in the Population options.
%   The Scale = 1 parameter determines the standard deviation at the first generation.
%   The Shrink = 1 parameter controls how the standard deviation shrinks as generations go by.
[P, F] = ga(@test, nVar,[],[],[],[], BOUNDS(:,1), BOUNDS(:,2), [], options)