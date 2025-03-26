%% 均衡点的确定
syms x y

% 定义参数（以情形1为例）
C_g1 = 10; R_g = 1.5; Delta_R = 1; C_g2 = 2; Z_g = 2.4; gamma = 0.5;
C_s1 = 3.5; R = 3; C_s2 = 1.5; f = 4; Z_s = 6; N = 5;

% 定义复制动态方程
dxdt = x*(1 - x)*(y*(-Delta_R - f - gamma*Z_g) + (R_g + Delta_R - C_g1 + f) - (-C_g2 - gamma*Z_g));
dydt = y*(1 - y)*(x*(Z_s + f - gamma*Z_s) - (N - C_s2 - gamma*Z_s) + (R - C_s1));

% 求解均衡点：dx/dt=0 和 dy/dt=0
eqns = [dxdt == 0, dydt == 0];
solutions = solve(eqns, [x, y]);

% 显示所有解
disp('均衡点：');
disp([solutions.x, solutions.y]);
%% Simulate
% % 情形1
% C_g1 = 10;   % 政府严格监管成本
% R_g = 1.5;   % 政府严格监管总收益
% Delta_R = 1;  % 政府严格监管发现违规的额外奖励
% C_g2 = 2;     % 政府宽松监管成本
% Z_g = 2.4;    % 政府声誉损失系数
% gamma = 0.5;  % 社会组织曝光概率
% C_s1 = 3.5;   % 市场积极努力成本
% R = 3;        % 市场积极努力总收益
% C_s2 = 1.5;   % 市场机会主义成本
% f = 4;        % 市场违规罚款
% Z_s = [6 3];      % 市场声誉损失系数
% N = 5;        % 市场机会主义总收益
% 
% lineStyles = {'--', '-'};
% % 定义复制动态方程
% for i = 1: 2
%     dxdt = @(x, y) x * (1 - x) * (y * (-Delta_R - f - gamma * Z_g) + ...
%     (R_g + Delta_R - C_g1 + f) - (-C_g2 - gamma * Z_g));
% 
%     dydt = @(x, y) y * (1 - y) * (x * (Z_s(i) + f - gamma * Z_s(i)) - ...
%     (N - C_s2 - gamma * Z_s(i)) + (R - C_s1));
% 
% % 数值模拟（时间范围0~20，初始值x=0.5, y=0.5）
%     tspan = [0 20];
%     initial = [0.5; 0.5];  % 初始策略概率
%     [t, sol] = ode45(@(t, s) [dxdt(s(1), s(2)); dydt(s(1), s(2))], tspan, initial);
% 
% % 绘制演化路径图
% 
%     subplot(1,2,i);
%     hold on
%     plot(t, sol(:,1), 'b', 'LineWidth', 1.5, 'LineStyle', lineStyles(1));
%     plot(t, sol(:,2), 'r', 'LineWidth', 1.5, 'LineStyle', lineStyles(2));
%     legend('政府主体', '市场主体');
%     grid on;
% 
% 
%     subplot(1,2,i);
%     hold on
%     plot(t, sol(:,1), 'b', 'LineWidth', 1.5, 'LineStyle', lineStyles(1));
%     plot(t, sol(:,2), 'r', 'LineWidth', 1.5, 'LineStyle', lineStyles(2));
%     legend('政府主体', '市场主体')
%     grid on;
% end

% 情形2
C_g1 = 10;   % 政府严格监管成本
R_g = [1.5 4.5];   % 政府严格监管总收益
Delta_R = 1;  % 政府严格监管发现违规的额外奖励
C_g2 = 2;     % 政府宽松监管成本
Z_g = 2.4;    % 政府声誉损失系数
gamma = 0.5;  % 社会组织曝光概率
C_s1 = 4.5;   % 市场积极努力成本
R = 4;        % 市场积极努力总收益
C_s2 = 4.3;   % 市场机会主义成本
f = 4;        % 市场违规罚款
Z_s = 3;      % 市场声誉损失系数
N = 5;        % 市场机会主义总收益

lineStyles = {'-', '--'};
for i = 1: 2
% 定义复制动态方程
    dxdt = @(x, y) x * (1 - x) * (y * (-Delta_R - f - gamma * Z_g) + ...
    (R_g(i) + Delta_R - C_g1 + f) - (-C_g2 - gamma * Z_g));

    dydt = @(x, y) y * (1 - y) * (x * (Z_s + f - gamma * Z_s) - ...
    (N - C_s2 - gamma * Z_s) + (R - C_s1));

% 数值模拟（时间范围0~20，初始值x=0.5, y=0.5）
    tspan = [0 20];
    initial = [0.5; 0.5];  % 初始策略概率
    [t, sol] = ode45(@(t, s) [dxdt(s(1), s(2)); dydt(s(1), s(2))], tspan, initial);

% 绘制演化路径图
    subplot(1,2,i);
    hold on
    plot(t, sol(:,1), 'b', 'LineWidth', 1.5, 'LineStyle', lineStyles(1));
    plot(t, sol(:,2), 'r', 'LineWidth', 1.5, 'LineStyle', lineStyles(2));
    legend('政府主体', '市场主体');
    grid on;


    subplot(1,2,i);
    hold on
    plot(t, sol(:,1), 'b', 'LineWidth', 1.5, 'LineStyle', lineStyles(1));
    plot(t, sol(:,2), 'r', 'LineWidth', 1.5, 'LineStyle', lineStyles(2));
    legend('政府主体', '市场主体')
    grid on;
end

