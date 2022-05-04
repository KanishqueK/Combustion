clear all;
clc;


z = readtable('Deltas.csv');

p_05 = z{:, 2};
q_05 = -1*z{:, 4};

dTdx_05 = max(p_05)
dYdx_05 = max(q_05)

r_05 = z{:, 3};
x_05 = z{:, 1};
l_05 = size(r_05);

[hm_05, h_05] = max(r_05)

for ii=1:(h_05-1)

    if r_05(h_05 - ii) <= (hm_05/2)
        indx1_05 = find(r_05 == r_05(h_05 - ii));
        break   
    end
end

for ii=1:(h_05-1)

    if r_05(h_05 + ii) <= (hm_05/2)
        indx2_05 = find(r_05 == r_05(h_05 + ii));
        break    
    end
end

dh_05 = x_05(indx2_05) - x_05(indx1_05);

p_055 = z{:, 6};
q_055 = -1*z{:, 8};

dTdx_055 = max(p_055)
dYdx_055 = max(q_055)

r_055 = z{:, 7};
x_055 = z{:, 5};
l_055 = size(r_055);

[hm_055, h_055] = max(r_055)

for ii=1:(h_055-1)

    if r_05(h_05 - ii) <= (hm_05/2)
        indx1_055 = find(r_055 == r_055(h_055 - ii));
        break   
    end
end

for ii=1:(h_055-1)

    if r_055(h_055 + ii) <= (hm_055/2)
        indx2_055 = find(r_055 == r_055(h_055 + ii));
        break    
    end
end

dh_055 = x_055(indx2_055) - x_055(indx1_055);

p_06 = z{:, 10};
q_06 = -1*z{:, 12};

dTdx_06 = max(p_06)
dYdx_06 = max(q_06)

r_06 = z{:, 11};
x_06 = z{:, 9};
l_06 = size(r_06);

[hm_06, h_06] = max(r_06)

for ii=1:(h_06-1)

    if r_06(h_06 - ii) <= (hm_06/2)
        indx1_06 = find(r_06 == r_06(h_06 - ii));
        break   
    end
end

for ii=1:(h_06-1)

    if r_06(h_06 + ii) <= (hm_06/2)
        indx2_06 = find(r_06 == r_06(h_06 + ii));
        break    
    end
end

dh_06 = x_06(indx2_06) - x_06(indx1_06);

p_065 = z{:, 14};
q_065 = -1*z{:, 16};

dTdx_065 = max(p_065)
dYdx_065 = max(q_065)

r_065 = z{:, 15};
x_065 = z{:, 13};
l_065 = size(r_065);

[hm_065, h_065] = max(r_065)

for ii=1:(h_065-1)

    if r_065(h_065 - ii) <= (hm_065/2)
        indx1_065 = find(r_065 == r_065(h_065 - ii));
        break   
    end
end

for ii=1:(h_065-1)

    if r_065(h_065 + ii) <= (hm_065/2)
        indx2_065 = find(r_065 == r_065(h_065 + ii));
        break    
    end
end

dh_065 = x_065(indx2_065) - x_065(indx1_065);

p_07 = z{:, 18};
q_07 = -1*z{:, 20};

dTdx_07 = max(p_07)
dYdx_07 = max(q_07)

r_07 = z{:, 19};
x_07 = z{:, 17};
l_07 = size(r_07);

[hm_07, h_07] = max(r_07)

for ii=1:(h_07-1)

    if r_07(h_07 - ii) <= (hm_07/2)
        indx1_07 = find(r_07 == r_07(h_07 - ii));
        break   
    end
end

for ii=1:(h_07-1)

    if r_07(h_07 + ii) <= (hm_07/2)
        indx2_07 = find(r_07 == r_07(h_07 + ii));
        break    
    end
end

dh_07 = x_07(indx2_07) - x_07(indx1_07);

p_075 = z{:, 22};
q_075 = -1*z{:, 24};

dTdx_075 = max(p_075)
dYdx_075 = max(q_075)

r_075 = z{:, 23};
x_075 = z{:, 21};
l_075 = size(r_075);

[hm_075, h_075] = max(r_075)

for ii=1:(h_075-1)

    if r_075(h_075 - ii) <= (hm_075/2)
        indx1_075 = find(r_075 == r_075(h_075 - ii));
        break   
    end
end

for ii=1:(h_075-1)

    if r_075(h_075 + ii) <= (hm_075/2)
        indx2_075 = find(r_075 == r_075(h_075 + ii));
        break    
    end
end

dh_075 = x_075(indx2_075) - x_075(indx1_075);

p_08 = z{:, 26};
q_08 = -1*z{:, 28};

dTdx_08 = max(p_08)
dYdx_08 = max(q_08)

r_08 = z{:, 27};
x_08 = z{:, 25};
l_08 = size(r_08);

[hm_08, h_08] = max(r_08)

for ii=1:(h_08-1)

    if r_08(h_08 - ii) <= (hm_08/2)
        indx1_08 = find(r_08 == r_08(h_08 - ii));
        break   
    end
end

for ii=1:(h_08-1)

    if r_08(h_08 + ii) <= (hm_08/2)
        indx2_08 = find(r_08 == r_08(h_08 + ii));
        break    
    end
end

dh_08 = x_08(indx2_08(2)) - x_08(indx1_08(1));

p_085 = z{:, 30};
q_085 = -1*z{:, 32};

dTdx_085 = max(p_085)
dYdx_085 = max(q_085)

r_085 = z{:, 31};
x_085 = z{:, 29};
l_085 = size(r_085);

[hm_085, h_085] = max(r_085)

for ii=1:(h_085-1)

    if r_085(h_085 - ii) <= (hm_085/2)
        indx1_085 = find(r_085 == r_085(h_085 - ii));
        break   
    end
end

for ii=1:(h_085-1)

    if r_085(h_085 + ii) <= (hm_085/2)
        indx2_085 = find(r_085 == r_085(h_085 + ii));
        break    
    end
end

dh_085 = x_085(indx2_085) - x_085(indx1_085);

p_09 = z{:, 34};
q_09 = -1*z{:, 36};

dTdx_09 = max(p_09)
dYdx_09 = max(q_09)

r_09 = z{:, 35};
x_09 = z{:, 33};
l_09 = size(r_09);

[hm_09, h_09] = max(r_09)

for ii=1:(h_09-1)

    if r_09(h_09 - ii) <= (hm_09/2)
        indx1_09 = find(r_09 == r_09(h_09 - ii));
        break   
    end
end

for ii=1:(h_09-1)

    if r_09(h_09 + ii) <= (hm_09/2)
        indx2_09 = find(r_09 == r_09(h_09 + ii));
        break    
    end
end

dh_09 = x_09(indx2_09(2)) - x_09(indx1_09(1));

r_095 = z{:, 39};
x_095 = z{:, 37};
l_095 = size(r_05);

[hm_095, h_095] = max(r_095)

for ii=1:(h_095-1)

    if r_095(h_095 - ii) <= (hm_095/2)
        indx1_095 = find(r_095 == r_095(h_095 - ii));
        break   
    end
end

for ii=1:(h_095-1)

    if r_095(h_095 + ii) <= (hm_095/2)
        indx2_095 = find(r_095 == r_095(h_095 + ii));
        break    
    end
end

dh_095 = x_095(indx2_095(2)) - x_095(indx1_095(1));

p_095 = z{:, 38};
q_095 = -1*z{:, 40};

dTdx_095 = max(p_095)
dYdx_095 = max(q_095)

p_1 = z{:, 42};
q_1 = -1*z{:, 44};

dTdx_1 = max(p_1)
dYdx_1 = max(q_1)

r_1 = z{:, 43};
x_1 = z{:, 41};
l_1 = size(r_1);

[hm_1, h_1] = max(r_1)

for ii=1:(h_1-1)

    if r_1(h_1 - ii) <= (hm_1/2)
        indx1_1 = find(r_1 == r_1(h_1 - ii));
        break   
    end
end

for ii=1:(h_1-1)

    if r_1(h_1 + ii) <= (hm_1/2)
        indx2_1 = find(r_1 == r_1(h_1 + ii));
        break    
    end
end

dh_1 = x_1(indx2_1) - x_1(indx1_1);

p_105 = z{:, 46};
q_105 = -1*z{:, 48};

dTdx_105 = max(p_105)
dYdx_105 = max(q_105)

r_105 = z{:, 47};
x_105 = z{:, 45};
l_105 = size(r_105);

[hm_105, h_105] = max(r_105)

for ii=1:(h_105-1)

    if r_105(h_105 - ii) <= (hm_105/2)
        indx1_105 = find(r_105 == r_105(h_105 - ii));
        break   
    end
end

for ii=1:(h_105-1)

    if r_105(h_105 + ii) <= (hm_105/2)
        indx2_105 = find(r_105 == r_105(h_105 + ii));
        break    
    end
end

dh_105 = x_105(indx2_105) - x_105(indx1_105);

r_11 = z{:, 51};
x_11 = z{:, 49};
l_11 = size(r_11);

[hm_11, h_11] = max(r_11)

for ii=1:(h_11-1)

    if r_11(h_11 - ii) <= (hm_11/2)
        indx1_11 = find(r_11 == r_11(h_11 - ii));
        break   
    end
end

for ii=1:(h_11-1)

    if r_11(h_11 + ii) <= (hm_11/2)
        indx2_11 = find(r_11 == r_11(h_11 + ii));
        break    
    end
end

dh_11 = x_11(indx2_11) - x_11(indx1_11);

p_11 = z{:, 50};
q_11 = -1*z{:, 52};

dTdx_11 = max(p_11)
dYdx_11 = max(q_11)

p_115 = z{:, 54};
q_115 = -1*z{:, 56};

dTdx_115 = max(p_115)
dYdx_115 = max(q_115)

r_115 = z{:, 55};
x_115 = z{:, 53};
l_115 = size(r_115);

[hm_115, h_115] = max(r_115)

for ii=1:(h_115-1)

    if r_115(h_115 - ii) <= (hm_115/2)
        indx1_115 = find(r_115 == r_115(h_115 - ii));
        break   
    end
end

for ii=1:(h_115-1)

    if r_115(h_115 + ii) <= (hm_115/2)
        indx2_115 = find(r_115 == r_115(h_115 + ii));
        break    
    end
end

dh_115 = x_115(indx2_115) - x_115(indx1_115);

p_12 = z{:, 58};
q_12 = -1*z{:, 60};

dTdx_12 = max(p_12)
dYdx_12 = max(q_12)

r_12 = z{:, 59};
x_12 = z{:, 57};
l_12 = size(r_12);

[hm_12, h_12] = max(r_12)

for ii=1:(h_12-1)

    if r_12(h_12 - ii) <= (hm_12/2)
        indx1_12 = find(r_12 == r_12(h_12 - ii));
        break   
    end
end

for ii=1:(h_12-1)

    if r_12(h_12 + ii) <= (hm_12/2)
        indx2_12 = find(r_12 == r_12(h_12 + ii));
        break    
    end
end

dh_12 = x_12(indx2_12) - x_12(indx1_12);

p_125 = z{:, 62};
q_125 = -1*z{:, 64};

dTdx_125 = max(p_125)
dYdx_125 = max(q_125)

r_125 = z{:, 63};
x_125 = z{:, 61};
l_125 = size(r_125);

[hm_125, h_125] = max(r_125)

for ii=1:(h_125-1)

    if r_125(h_125 - ii) <= (hm_125/2)
        indx1_125 = find(r_125 == r_125(h_125 - ii));
        break   
    end
end

for ii=1:(h_125-1)

    if r_125(h_125 + ii) <= (hm_125/2)
        indx2_125 = find(r_125 == r_125(h_125 + ii));
        break    
    end
end

dh_125 = x_125(indx2_125) - x_125(indx1_125);

p_13 = z{:, 66};
q_13 = -1*z{:, 68};

dTdx_13 = max(p_13)
dYdx_13 = max(q_13)

r_13 = z{:, 67};
x_13 = z{:, 65};
l_13 = size(r_13);

[hm_13, h_13] = max(r_13)

for ii=1:(h_13-1)

    if r_13(h_13 - ii) <= (hm_13/2)
        indx1_13 = find(r_13 == r_13(h_13 - ii));
        break   
    end
end

for ii=1:(h_13-1)

    if r_13(h_13 + ii) <= (hm_13/2)
        indx2_13 = find(r_13 == r_13(h_13 + ii));
        break    
    end
end

dh_13 = x_13(indx2_13) - x_13(indx1_13);

p_135 = z{:, 70};
q_135 = -1*z{:, 72};

dTdx_135 = max(p_135)
dYdx_135 = max(q_135)

r_135 = z{:, 71};
x_135 = z{:, 69};
l_135 = size(r_135);

[hm_135, h_135] = max(r_135)

for ii=1:(h_135-1)

    if r_135(h_135 - ii) <= (hm_135/2)
        indx1_135 = find(r_135 == r_135(h_135 - ii));
        break   
    end
end

for ii=1:(h_135-1)

    if r_135(h_135 + ii) <= (hm_135/2)
        indx2_135 = find(r_135 == r_135(h_135 + ii));
        break    
    end
end

dh_135 = x_135(indx2_135) - x_135(indx1_135);

p_14 = z{:, 74};
q_14 = -1*z{:, 76};

dTdx_14 = max(p_14)
dYdx_14 = max(q_14)

r_14 = z{:, 75};
x_14 = z{:, 73};
l_14 = size(r_14);

[hm_14, h_14] = max(r_14)

for ii=1:(h_14-1)

    if r_14(h_14 - ii) <= (hm_14/2)
        indx1_14 = find(r_14 == r_14(h_14 - ii));
        break   
    end
end

for ii=1:(h_14-1)

    if r_14(h_14 + ii) <= (hm_14/2)
        indx2_14 = find(r_14 == r_14(h_14 + ii));
        break    
    end
end

dh_14 = x_14(indx2_14) - x_14(indx1_14);

p_145 = z{:, 78};
q_145 = -1*z{:, 80};

dTdx_145 = max(p_145)
dYdx_145 = max(q_145)

r_145 = z{:, 79};
x_145 = z{:, 77};
l_145 = size(r_145);

[hm_145, h_145] = max(r_145)

for ii=1:(h_145-1)

    if r_145(h_145 - ii) <= (hm_145/2)
        indx1_145 = find(r_145 == r_145(h_145 - ii));
        break   
    end
end

for ii=1:(h_145-1)

    if r_145(h_145 + ii) <= (hm_145/2)
        indx2_145 = find(r_145 == r_145(h_145 + ii));
        break    
    end
end

dh_145 = x_145(indx2_145) - x_145(indx1_145);

p_15 = z{:, 82};
q_15 = -1*z{:, 84};

dTdx_15 = max(p_15)
dYdx_15 = max(q_15)

r_15 = z{:, 83};
x_15 = z{:, 81};
l_15 = size(r_15);

[hm_15, h_15] = max(r_15)

for ii=1:(h_15-1)

    if r_15(h_15 - ii) <= (hm_15/2)
        indx1_15 = find(r_15 == r_15(h_15 - ii));
        break   
    end
end

for ii=1:(h_15-1)

    if r_15(h_15 + ii) <= (hm_15/2)
        indx2_15 = find(r_15 == r_15(h_15 + ii));
        break    
    end
end

dh_15 = x_15(indx2_15(2)) - x_15(indx1_15(1));


zx = r_1(368)
xz = r_1(542)
