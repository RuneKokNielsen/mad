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

kernel = zeros(n, n);
for x = 1:n
    for y = 1:n
        kernel(x, y) = gaussianKernel(transpose(histograms(x,:)), transpose(histograms(y,:)), width);
    end
end

result = kernel;