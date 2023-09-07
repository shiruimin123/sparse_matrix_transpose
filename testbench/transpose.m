% Memory testcase

% Features:
%  - matrix transpose
%  - Reading one block of SRAM
%  - SRAM and Register File are in the same column.


dim = 16;

A_mem = [1:dim*dim];  %! MEM<> [0,0]
B_mem = [1:dim*dim];  %! MEM<> [0,0]
parallel_num = 4;




A_R1_vec = zeros(1,dim*parallel_num);  %! RFILE<> [0,0]
A_R2_vec = zeros(1,dim*parallel_num);  %! RFILE<> [0,3]
A_R3_vec = zeros(1,dim*parallel_num);  %! RFILE<> [1,0]
A_R4_vec = zeros(1,dim*parallel_num);  %! RFILE<> [1,3]

B_R1_vec = zeros(1,dim*parallel_num);  %! RFILE<> [0,1]
B_R2_vec = zeros(1,dim*parallel_num);  %! RFILE<> [0,2]
B_R3_vec = zeros(1,dim*parallel_num);  %! RFILE<> [1,1]
B_R4_vec = zeros(1,dim*parallel_num);  %! RFILE<> [1,2]


%A_C1_vec = zeros(1,dim);  %! RFILE<> [0,2]


for i = 1 : parallel_num

    A_R1_vec(1+16*(i-1) : 16*i) = A_mem(1+16*(i-1) : 16*i);
    A_R2_vec(1+16*(i+3) : 16*(i+4)) = A_mem(1+16*(i+3) : 16*(i+4));
    A_R3_vec(1+16*(i+7) : 16*(i+8)) = A_mem(1+16*(i+7) : 16*(i+8));
    A_R4_vec(1+16*(i+11) : 16*(i+12)) = A_mem(1+16*(i+11) : 16*(i+12));


    %B_R2_vec(i) = A_R1_vec((i-1)*dim+5);
    %B_R2_vec(i+4) = A_R2_vec((i-1)*dim+5);
   % B_R2_vec(i+8) = A_R3_vec((i-1)*dim+5);
   % B_R2_vec(i+12) = A_R4_vec((i-1)*dim+5);
end

%for j = 1 : parallel_num
%	for i = 1 : parallel_num
%		B_R1_vec(i + dim*(j-1))  = A_R1_vec(j+(i-1)*dim);
%	end
%end

B_R1_vec(silago_agu_linear_2d(1, 16, 4, 1, 4)) = A_R1_vec(silago_agu_linear_2d(1, 1, 4, 16, 4));

%B_R1_vec(1) = A_R1_vec(1); 
%B_R1_vec(2) = A_R1_vec(17); 
%B_R1_vec(3) = A_R1_vec(33); 
%B_R1_vec(4) = A_R1_vec(49); 

%j=1;
%for i = 1 : parallel_num
%        B_R1_vec(i+dim*(j-1)) = A_R1_vec((i-1)*dim+j) + 0; %! DPU[0,0]
%end
%
%for i = 1 : parallel_num
%    B_R1_vec(i+4+dim*(j-1)) = A_R2_vec((i-1)*dim+j) + 0; %! DPU[0,3]
%end
%
%for i = 1 : parallel_num
%    B_R1_vec(i+8+dim*(j-1)) = A_R3_vec((i-1)*dim+j) + 0; %! DPU[1,0]
%end
%
%for i = 1 : parallel_num
%   B_R1_vec(i+12+dim*(j-1)) = A_R4_vec((i-1)*dim+j) + 0; %! DPU[1,3]
%end
%
%B_mem(1+(j-1)*dim:j*dim)=B_R1_vec(1+(j-1)*dim:j*dim);


%for i = 1 : parallel_num
%    B_R4_vec(i) = A_R1_vec((i-1)*dim+1) + 0; %! DPU[0,0]
%    B_R1_vec(i+4) = A_R2_vec((i-1)*dim+1) + 0; %! DPU[0,3]
%    B_R2_vec(i+8) = A_R3_vec((i-1)*dim+1) + 0; %! DPU[1,0]
 %   B_R3_vec(i+12) = A_R4_vec((i-1)*dim+1) + 0; %! DPU[1,3]
%end


