%%
clear all;
clc;


load('cantera_0H2_CH4_Tu300_0.65.mat');

fname = 'Heatrelease'

z = readtable('CH4_adiabatic_Tu300_0.0H2_0.65.csv');
F_C = z{:, 58};
Y_CH4 = z{:, 18};
%%

wkdir = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.5_ms300';
gridf = sprintf('%s/Reactants_grids_0.h5',wkdir);


wkdir2 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.35_ms350';
gridf2 = sprintf('%s/Reactants_grids_0.h5',wkdir2);


wkdir3 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.35_ms400';
gridf3 = sprintf('%s/Reactants_grids_0.h5',wkdir3);

wkdir4 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.8_ms500';
gridf4 = sprintf('%s/Reactants_grids_0.h5',wkdir4);

wkdir5 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.2_ms600';
gridf5 = sprintf('%s/Reactants_grids_0.h5',wkdir5);

wkdir6 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.2_ms700';
gridf6 = sprintf('%s/Reactants_grids_0.h5',wkdir6);

wkdir7 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.05_ms800';
gridf7 = sprintf('%s/Reactants_grids_0.h5',wkdir7);

wkdir8 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.05_ms900';
gridf8 = sprintf('%s/Reactants_grids_0.h5',wkdir8);

wkdir9 = '/work/home/anindya/Kanishque_Cases/LES_results/SYm0.05_ms1000';
gridf9 = sprintf('%s/Reactants_grids_0.h5',wkdir9);

grid1 = 'FirstGrid';

u_u = 1.0;

N_start=150;      
N_stop=150;
srb_f=0;srb_l=23;
cI = 0;
T_iso = 300;
for srcblk = srb_f:srb_l
    
    cI=cI+1;
    h5id = H5F.open(gridf,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path);
    xcoord = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord = permute(xcoord,[3,2,1]);
    xcoord = squeeze(xcoord(:,:,5));
    
    ycoord_path = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path);
    ycoord = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord = permute(ycoord,[3,2,1]);
    ycoord = squeeze(ycoord(:,:,5));
    
    [bNI,bNJ] = size(xcoord);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco(si:ei,sj:ej) = xcoord;
    X_co = Xco(:,1);
    Y_co(si:ei,sj:ej) = ycoord;
end
cI = 0;
for srcblk = srb_f:srb_l
    
    cI=cI+1;
    h5id = H5F.open(gridf2,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path2 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path2);
    xcoord2 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord2 = permute(xcoord2,[3,2,1]);
    xcoord2 = squeeze(xcoord2(:,:,5));
    
    ycoord_path2 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path2);
    ycoord2 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord2 = permute(ycoord2,[3,2,1]);
    ycoord2 = squeeze(ycoord2(:,:,5));
    
    [bNI2,bNJ2] = size(xcoord2);
    
    si2 = 1 +(cI-1)*bNI2; sj2 = 1;
    ei2 = cI*bNI2; ej2 = bNJ2;
    
    Xco2(si2:ei2,sj2:ej2) = xcoord2;
    X_co2 = Xco2(:,1);
    Y_co2(si2:ei2,sj2:ej2) = ycoord2;
end
cI = 0;
for srcblk = srb_f:srb_l
    
    cI=cI+1;
    h5id = H5F.open(gridf3,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path3 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path3);
    xcoord3 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord3 = permute(xcoord3,[3,2,1]);
    xcoord3 = squeeze(xcoord3(:,:,5));
    
    ycoord_path3 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path3);
    ycoord3 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord3 = permute(ycoord3,[3,2,1]);
    ycoord3 = squeeze(ycoord3(:,:,5));
    
    [bNI3,bNJ3] = size(xcoord3);
    
    si3 = 1 +(cI-1)*bNI3; sj3 = 1;
    ei3 = cI*bNI3; ej3 = bNJ3;
    
    Xco3(si3:ei3,sj3:ej3) = xcoord3;
    X_co3 = Xco3(:,1);
    Y_co3(si3:ei3,sj3:ej3) = ycoord3;
end

cI = 0;
for srcblk = srb_f:srb_l
    
    bNI = 0;
    bNJ = 0;
    si = 0;
    sj = 0;
    ci = 0;
    cj = 0;
   
    cI=cI+1;
    h5id = H5F.open(gridf4,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path4 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path4);
    xcoord4 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord4 = permute(xcoord4,[3,2,1]);
    xcoord4 = squeeze(xcoord4(:,:,5));
    
    ycoord_path4 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path4);
    ycoord4 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord4 = permute(ycoord4,[3,2,1]);
    ycoord4 = squeeze(ycoord4(:,:,5));
    
    [bNI,bNJ] = size(xcoord4);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco4(si:ei,sj:ej) = xcoord4;
    X_co4 = Xco4(:,1);
    Y_co4(si:ei,sj:ej) = ycoord4;
end

cI = 0;
for srcblk = srb_f:srb_l
    
    bNI = 0;
    bNJ = 0;
    si = 0;
    sj = 0;
    ci = 0;
    cj = 0;
   
    cI=cI+1;
    h5id = H5F.open(gridf5,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path5 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path5);
    xcoord5 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord5 = permute(xcoord5,[3,2,1]);
    xcoord5 = squeeze(xcoord5(:,:,5));
    
    ycoord_path5 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path5);
    ycoord5 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord5 = permute(ycoord5,[3,2,1]);
    ycoord5 = squeeze(ycoord5(:,:,5));
    
    [bNI,bNJ] = size(xcoord5);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco5(si:ei,sj:ej) = xcoord5;
    X_co5 = Xco5(:,1);
    Y_co5(si:ei,sj:ej) = ycoord5;
end

cI = 0;
for srcblk = srb_f:srb_l
    
    bNI = 0;
    bNJ = 0;
    si = 0;
    sj = 0;
    ci = 0;
    cj = 0;
   
    cI=cI+1;
    h5id = H5F.open(gridf6,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path6= sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path6);
    xcoord6 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord6 = permute(xcoord6,[3,2,1]);
    xcoord6 = squeeze(xcoord6(:,:,5));
    
    ycoord_path6 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path6);
    ycoord6 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord6 = permute(ycoord6,[3,2,1]);
    ycoord6 = squeeze(ycoord6(:,:,5));
    
    [bNI,bNJ] = size(xcoord6);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco6(si:ei,sj:ej) = xcoord6;
    X_co6 = Xco6(:,1);
    Y_co6(si:ei,sj:ej) = ycoord6;
end

cI = 0;
for srcblk = srb_f:srb_l
    
    bNI = 0;
    bNJ = 0;
    si = 0;
    sj = 0;
    ci = 0;
    cj = 0;
   
    cI=cI+1;
    h5id = H5F.open(gridf7,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path7 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path7);
    xcoord7 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord7 = permute(xcoord7,[3,2,1]);
    xcoord7 = squeeze(xcoord7(:,:,5));
    
    ycoord_path7 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path7);
    ycoord7 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord7 = permute(ycoord7,[3,2,1]);
    ycoord7 = squeeze(ycoord7(:,:,5));
    
    [bNI,bNJ] = size(xcoord7);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco7(si:ei,sj:ej) = xcoord7;
    X_co7 = Xco7(:,1);
    Y_co7(si:ei,sj:ej) = ycoord7;
end

cI = 0;
for srcblk = srb_f:srb_l
    
    bNI = 0;
    bNJ = 0;
    si = 0;
    sj = 0;
    ci = 0;
    cj = 0;
   
    cI=cI+1;
    h5id = H5F.open(gridf8,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path8 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path8);
    xcoord8 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord8 = permute(xcoord8,[3,2,1]);
    xcoord8 = squeeze(xcoord8(:,:,5));
    
    ycoord_path8 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path8);
    ycoord8 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord8 = permute(ycoord8,[3,2,1]);
    ycoord8 = squeeze(ycoord8(:,:,5));
    
    [bNI,bNJ] = size(xcoord8);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco8(si:ei,sj:ej) = xcoord8;
    X_co8 = Xco8(:,1);
    Y_co8(si:ei,sj:ej) = ycoord8;
end

cI = 0;
for srcblk = srb_f:srb_l
    
    bNI = 0;
    bNJ = 0;
    si = 0;
    sj = 0;
    ci = 0;
    cj = 0;
   
    cI=cI+1;
    h5id = H5F.open(gridf9,'H5F_ACC_RDONLY','H5P_DEFAULT');
    
    xcoord_path9 = sprintf('%s/source_blocks/%d/x',grid1,srcblk);
    dset_id = H5D.open(h5id,xcoord_path9);
    xcoord9 = H5D.read(dset_id);
    H5D.close(dset_id);
    xcoord9 = permute(xcoord9,[3,2,1]);
    xcoord9 = squeeze(xcoord9(:,:,5));
    
    ycoord_path9 = sprintf('%s/source_blocks/%d/y',grid1,srcblk);
    dset_id = H5D.open(h5id,ycoord_path9);
    ycoord9 = H5D.read(dset_id);
    H5D.close(dset_id);
    ycoord9 = permute(ycoord9,[3,2,1]);
    ycoord9 = squeeze(ycoord9(:,:,5));
    
    [bNI,bNJ] = size(xcoord9);
    
    si = 1 +(cI-1)*bNI; sj = 1;
    ei = cI*bNI; ej = bNJ;
    
    Xco9(si:ei,sj:ej) = xcoord9;
    X_co9 = Xco9(:,1);
    Y_co9(si:ei,sj:ej) = ycoord9;
end

q=1;
for N_idx = N_start:N_stop
    
    cI=0;
    
    for srcblk = srb_f:srb_l
        
        cI=cI+1;
    
        solfilename = sprintf('%s/Reactants_%d.h5',wkdir,N_idx);
        solfilename2 = sprintf('%s/Reactants_%d.h5',wkdir2,N_idx);
        solfilename3 = sprintf('%s/Reactants_%d.h5',wkdir3,N_idx);
        solfilename4 = sprintf('%s/Reactants_%d.h5',wkdir4,N_idx);
        solfilename5 = sprintf('%s/Reactants_%d.h5',wkdir5,N_idx);
        solfilename6 = sprintf('%s/Reactants_%d.h5',wkdir6,N_idx);
        solfilename7 = sprintf('%s/Reactants_%d.h5',wkdir7,N_idx);
        solfilename8 = sprintf('%s/Reactants_%d.h5',wkdir8,N_idx);
        solfilename9 = sprintf('%s/Reactants_%d.h5',wkdir9,N_idx);

        dpath = sprintf('/Reactants/%s/fields/%d/Temperature',grid1,srcblk);
        T = h5read(solfilename,dpath);   
        T = permute(T,[3,2,1]);
        T = squeeze(T(:,:,5));
        
        [bNI,bNJ] = size(T);
        
        si = 1 +(cI-1)*bNI; sj = 1;
        ei = cI*bNI; ej = bNJ;
   
        temp(si:ei,sj:ej) = T;
        
    %%reading velocity Field
        dpath = sprintf('/Reactants/%s/fields/%d/u_velocity',grid1,srcblk);
        U = h5read(solfilename,dpath);  
        U = permute(U,[3,2,1]);
        U = squeeze(U(:,:,5));  
        u_vel(si:ei,sj:ej) = U;
        
     %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F(si:ei,sj:ej) = f;
        F_f = F(:, 1);
        
        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename2,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f2(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename2,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F2(si:ei,sj:ej) = f;
        F_f2 = F2(:, 1);
               
         %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename3,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f3(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename3,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F3(si:ei,sj:ej) = f;
        F_f3 = F3(:, 1);
        
        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename4,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f4(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename4,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F4(si:ei,sj:ej) = f;
        F_f4 = F4(:, 1);

        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename5,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f5(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename5,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F5(si:ei,sj:ej) = f;
        F_f5 = F5(:, 1);

        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename6,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f6(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename6,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F6(si:ei,sj:ej) = f;
        F_f6 = F6(:, 1);

        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename7,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f7(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename7,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F7(si:ei,sj:ej) = f;
        F_f7 = F7(:, 1);

        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename8,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f8(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename8,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F8(si:ei,sj:ej) = f;
        F_f8 = F8(:, 1);

        %%reading species
        dpath = sprintf('/Reactants/%s/fields/%d/CH4',grid1,srcblk);
        f = h5read(solfilename9,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        ch4_f9(si:ei,sj:ej) = f;
        
        dpath = sprintf('/Reactants/%s/fields/%d/%s',grid1,srcblk,fname);
        f = h5read(solfilename9,dpath); 
        f = permute(f,[3,2,1]);
        f = squeeze(f(:,:,5));
        F9(si:ei,sj:ej) = f;
        F_f9 = F9(:, 1);
    end
    
   
    
  
    
end

%%
ch4_u = max(ch4_f);
ch4_u2 = max(ch4_f2);
ch4_u3 = max(ch4_f3);
ch4_u4 = max(ch4_f4);
ch4_u5 = max(ch4_f5);
ch4_u6 = max(ch4_f6);
ch4_u7 = max(ch4_f7);
ch4_u8 = max(ch4_f8);
ch4_u9 = max(ch4_f9);

ch4_b = 0.0;

cC = Y_CH4./ch4_u;
cM = ch4_f./ch4_u;
cM2 = ch4_f2./ch4_u2;
cM3 = ch4_f3./ch4_u3;
cM4 = ch4_f4./ch4_u4;
cM5 = ch4_f5./ch4_u5;
cM6 = ch4_f6./ch4_u6;
cM7 = ch4_f7./ch4_u7;
cM8 = ch4_f8./ch4_u8;
cM9 = ch4_f9./ch4_u9;

idx_C = find(cC<0.5,1)+4;

idx_M = find(cM<0.5,1);
idx_M2 = find(cM2<0.5,1);
idx_M3 = find(cM3<0.5,1);
idx_M4 = find(cM4<0.5,1);
idx_M5 = find(cM5<0.5,1);
idx_M6 = find(cM6<0.5,1);
idx_M7 = find(cM7<0.5,1);
idx_M8 = find(cM8<0.5,1);
idx_M9 = find(cM9<0.5,1);

xC = x - x(idx_C);
xM = X_co - X_co(idx_M);
xM2 = X_co2 - X_co2(idx_M2);
xM3 = X_co3 - X_co3(idx_M3);
xM4 = X_co4 - X_co4(idx_M4);
xM5 = X_co5 - X_co5(idx_M5);
xM6 = X_co6 - X_co6(idx_M6);
xM7 = X_co7 - X_co7(idx_M7);
xM8 = X_co8 - X_co8(idx_M8);
xM9 = X_co9 - X_co9(idx_M9);

%%
figure(1)
plot(xM,ch4_f,'bx',xC,Y_CH4,'b--','Markersize',10,'Linewidth',2);
xlim([-3e-3 3e-3]);
set(gca,'Fontsize',30)
xlabel('x (m)','Interpreter','latex')
ylabel('Y','Interpreter','latex')

figure(2)
plot (xC,F_C,'k-','Displayname','Cantera Solution (s_L = 0.154709 m/s)', 'Linewidth',4,'MarkerSize',25);
hold on
plot(xM,F_f,'xr--','Displayname','dx=300 \mum, \beta =0.5 (s_L = 0.1573 m/s)','Markersize',25,'Linewidth',4);
plot(xM2,F_f2,'+g--','Displayname','dx=350 \mum, \beta =0.35 (s_L = 0.1478 m/s)','Markersize',25,'Linewidth',4);
plot(xM3,F_f3,'om--','Displayname','dx=400 \mum, \beta =0.35 (s_L = 0.1547 m/s)','Markersize',25,'Linewidth',4);
plot(xM4,F_f4,'*b--','Displayname','dx=500 \mum, \beta =0.8 (s_L = 0.1271 m/s)','Markersize',25,'Linewidth',4);
plot(xM5,F_f5,'+c--','Displayname','dx=600 \mum, \beta =0.2 (s_L = 0.0943 m/s)','Markersize',25,'Linewidth',4);
plot(xM6,F_f6,'oy--','Displayname','dx=700 \mum, \beta =0.2 (s_L = 0.1368 m/s)','Markersize',25,'Linewidth',4);
plot(xM7,F_f7,'*r--','Displayname','dx=800 \mum, \beta =0.05 (s_L = 0.1059 m/s)','Markersize',25,'Linewidth',4);
plot(xM8,F_f8,'xm--','Displayname','dx=900 \mum, \beta =0.05 (s_L = 0.1026 m/s)','Markersize',25,'Linewidth',4);
plot(xM3,F_f3,'+b--','Displayname','dx=1000 \mum, \beta =0.05 (s_L = 0.1103 m/s)','Markersize',25,'Linewidth',4);

hold off
lgd = legend;
lgd.NumColumns = 1;
legend ('Location','northeast')
xlim([-1e-3 5e-3]);
%ylim([0 1.5]);
set(gca,'Fontsize',14)
xlabel('x (m)','Interpreter','latex')
ylabel('Y[OH]','Interpreter','latex')
%ylabel('Heat Release Rate ($W/m^3$)','Interpreter','latex')
