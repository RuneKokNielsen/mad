function result = baseline_2(graphs, width)

n = size(graphs, 2);
fieldName = 'am';

vector = zeros(n,1);
for i = 1:n
    vector(i) = size(graphs(i).(fieldName),1);
end

kernel = zeros(n, n);
for x = 1:n
    for y = 1:n
        kernel(x, y) = gaussianKernel(vector(x), vector(y), width);
    end
end

result = kernel;