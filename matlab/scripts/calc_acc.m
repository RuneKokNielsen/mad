function result = calc_acc(graph,lk,n,pick_kernel)

tlk = transpose(lk);

if pick_kernel == 1
    h_WL = 0;
    K_WL = WL(mutag, h_WL, 0);
    result = runntimes(K_WL{1,h_WL + 1}, tlk, n);
elseif pick_kernel == 2
    h_RG = 0;
    K_RG = RGkernel(mutag, h_RG);
    result = runntimes(K_RG, tlk, n);
elseif pick_kernel == 3 
    K_l3 = l3graphletkernel(mutag);
    result = runntimes(K_l3, tlk, n);
elseif pick_kernel == 4
    cols = size(graph,2);
    maxDegree = 0;
    degrees = cell(1,cols);
    for col = 1:cols
       degrees{col} = sum(full(graph(col).('am')),2);
       maxDegree = max([maxDegree, max(degrees{col})]);
    end
    K_RW = lRWkernel(graph, 10^(1/maxDegree^2), 0);
    result = runntimes(K_RW, tlk, n);
elseif pick_kernel == 5
    K_sp = spkernel(graph, 0);
    result = runntimes(K_sp, tlk, n);
else
    error('Pick Kernel');
end