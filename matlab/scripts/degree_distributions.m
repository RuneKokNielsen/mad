function result = degree_distributions(graphs, width)

%Script parameters
%fileName = 'MUTAG.mat';
%dataSet = 'MUTAG';
fieldName = 'am';


%data = importdata(fileName);
%[rows,cols] = size(data.(dataSet));
cols = size(graphs,2);
maxDegree = 0;
degrees = cell(1,cols);
%Calculates vector of degrees of each row in the adjacency matrix for each row
%in the data set. Also determines the highest degree across all rows.
for col = 1:cols
   %degrees{col} = sum(full(data.(dataSet)(col).(fieldName)),2);
   degrees{col} = sum(full(graphs(col).(fieldName)),2);
   maxDegree = max([maxDegree, max(degrees{col})]);
end

%Creates equal length degree distributions for all rows.
%Also sums all the distributions into a total distribution
distributions = zeros(maxDegree, cols);
totalDistribution = zeros(maxDegree,1);
for degree = 1:maxDegree
    for col = 1:cols
        distributions(degree, col) = nnz(degrees{col}==degree);
        totalDistribution(degree) = totalDistribution(degree) + nnz(degrees{col}==degree);
    end
end

%Creates kernel matrix of degree distributions. I.e. dot product of each
%pair of distributions 
kernelMatrix = zeros(cols, cols);
for x = 1:cols
    for y = 1:cols
        %kernelMatrix(x, y) = dot(distributions(:,x), distributions(:,y));
        kernelMatrix(x, y) = gaussianKernel(distributions(:,x), distributions(:,y), width);
    end
end

result = kernelMatrix;





