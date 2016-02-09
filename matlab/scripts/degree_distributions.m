%Script parameters
fileName = '../data/DD.mat';
dataSet = 'DD';
fieldName = 'am';


data = importdata(fileName);
[rows,cols] = size(data.(dataSet));
maxDegree = 0;
degrees = cell(1,cols);
%Calculates vector of degrees of each row in the am field for each row in
%the DD data set. Also determines the highest degree across all rows.
for col = 1:cols
   degrees{col} = sum(full(data.(dataSet)(col).(fieldName)),2);
   maxDegree = max([maxDegree, max(degrees{col})]);
end

%Sums the number of occurences of each degree across all rows.
distribution = zeros(maxDegree,1);
for degree = 1:maxDegree
    for col = 1:cols
        distribution(degree) = distribution(degree) + nnz(degrees{col}==degree);
    end
end

disp(distribution);
bar(distribution);
