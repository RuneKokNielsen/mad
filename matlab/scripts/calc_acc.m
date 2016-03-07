function result = calc_acc(graphs,lk,n,pick_kernel)

tlk = transpose(lk);
width = 50;

if pick_kernel == 1
    h_WL = 10; %Number of iterations.
    K_WL = WL(graphs, h_WL, 0);
    result = runntimes(K_WL{1,h_WL + 1}, tlk, n);
elseif pick_kernel == 2
    h_RG = 3; %Maximal tree height.
    K_RG = RGkernel(graphs, h_RG);
    result = runntimes(K_RG, tlk, n);
elseif pick_kernel == 3 
    K_l3 = l3graphletkernel(graphs);
    result = runntimes(K_l3, tlk, n);
elseif pick_kernel == 4
    cols = size(graphs,2);
    maxDegree = 0;
    degrees = cell(1,cols);
    for col = 1:cols
       degrees{col} = sum(full(graphs(col).('am')),2);
       maxDegree = max([maxDegree, max(degrees{col})]);
    end
    K_RW = lRWkernel(graphs, 1/maxDegree^2, 0);
    result = runntimes(K_RW, tlk, n);
elseif pick_kernel == 5
    K_sp = spkernel(graphs, 0);
    result = runntimes(K_sp, tlk, n);
elseif pick_kernel == 6
    K_GH = GraphHopper_dataset(graphs, 'dirac', 0, 0);
    result = runntimes(K_GH, tlk, n);
elseif pick_kernel == 7
    K_DD = degree_distributions(graphs, width);
    result = runntimes(K_DD, tlk, n);
elseif pick_kernel == 8
    K_B1 = baseline_1(graphs, width);
    result = runntimes(K_B1, tlk, n);
elseif pick_kernel == 9
    K_B2 = baseline_2(graphs, width);
    result = runntimes(K_B2, tlk, n);
else
    error('Pick Kernel');
end