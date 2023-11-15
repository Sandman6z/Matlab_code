% 使用GPU进行计算
A_gpu = gpuArray(rand(1000));
B_gpu = gpuArray(rand(1000));

% 开始计时
tic

% 执行需要测试的代码段
C_gpu = A_gpu * B_gpu;

% 停止计时，并获取执行时间
execution_time_gpu = toc;

fprintf('使用GPU的执行时间：%f秒\n', execution_time_gpu);

% % 将使用GPU的代码段注释掉或修改为使用CPU进行计算
% A_cpu = rand(1000);
% B_cpu = rand(1000);
% 
% % 开始计时
% tic
% 
% % 执行需要测试的代码段
% C_cpu = A_cpu * B_cpu;
% 
% % 停止计时，并获取执行时间
% execution_time_cpu = toc;
% 
% % 比较两次执行时间的结果
% fprintf('不使用GPU的执行时间：%f秒\n', execution_time_cpu);
