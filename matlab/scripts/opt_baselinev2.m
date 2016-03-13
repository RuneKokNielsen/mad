function result = opt_baselinev2(funKernel, graphs, labels)

labels = transpose(labels);

wValues = [0.1, 0.5, 1, 5, 10, 25, 50, 75, 100, 200, 500, 750, 1000];


multiK = arrayfun(@ (x) (feval(funKernel, graphs, x)), wValues, 'un',0);

result = runntimes_multi(multiK, labels, 10);

end