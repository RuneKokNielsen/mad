function result = calc_acc(graph,lk,n,pick_kernel)

tlk = transpose(lk);

if pick_kernel == 1
    h_WL = 0;
    K_WL = WL(mutag, h_WL, 0);
    result = runntimes(K_WL{1,h_WL + 1}, tlmutag, n);
elseif pick_kernel == 2
    h_RG = 0;
    K_RG = RGkernel(mutag, h_RG);
    result = runntimes(K_RG, tlmutag, n);
elseif pick_kernel == 3 
    K_l3 = l3graphletkernel(mutag);
    result = runntimes(K_l3, tlmutag, n);
%{
elseif pick_kernel == 4
    lRWkernel(graph, lambda, size{1 = small, 0 = otherwise})
%}
elseif pick_kernel == 5
    K_sp = spkernel(graph, 0);
    result = runntimes(K_sp, tlk, n);
else
    error('Pick Kernel');
end