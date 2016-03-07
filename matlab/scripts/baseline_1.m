function result = baseline_1(graphs, width)



n = size(graphs, 2);
globalMaxLabel = 0;

for graph = 1:n
    maxLabel = max(graphs(graph).nl.values);
    globalMaxLabel = max([globalMaxLabel, maxLabel]);
end

histograms = zeros(n, globalMaxLabel);
for graph = 1:n
    for label = 1:globalMaxLabel
       histograms(graph, label) = nnz(graphs(graph).nl.values == label);
    end
end

function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim
xny         =   x1-x2;
Normxny    =   xny'*xny;
sim         =   exp(-Normxny/(2*sigma^2));

end

kernel = zeros(n, n);
for x = 1:n
    for y = 1:n
        kernel(x, y) = gaussianKernel(transpose(histograms(x,:)), transpose(histograms(y,:)), width);
    end
end

result = kernel;

end
