function result = opt_baseline(funKernel, graphs, labels)

t_labels = transpose(labels);

wValues = [0.1, 0.5, 1, 5, 10, 25, 50, 100, 200, 500, 1000];
function result = calc_acc(w)
    K = feval(funKernel, graphs, w);
    acc = runntimes(K, t_labels, 10);
    result = acc.mean;
end

result=arrayfun(@calc_acc,  wValues)

end