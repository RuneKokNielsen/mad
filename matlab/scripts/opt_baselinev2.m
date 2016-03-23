function result = opt_baselinev2(funKernel, graphs, labels)

labels = transpose(labels);

wValues = [0.001, 0.01, 0.1, 1, 10, 100, 1000];


multiK = arrayfun(@ (x) (feval(funKernel, graphs, x)), wValues, 'un',0);

result = runntimes_multi(multiK, labels, 10);

end