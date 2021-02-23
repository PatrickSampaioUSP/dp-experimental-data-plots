function plot_experimental_data(sampleData)
    %% Ship parameters
    d3 = 0.4245;
    d1 = -0.0675;
    d2 = 0.0675;
    
    az1_c = cosd(sampleData.alpha(1,:));
    az1_s = sind(sampleData.alpha(1,:));
    
    az2_c = cosd(sampleData.alpha(2,:));
    az2_s = sind(sampleData.alpha(2,:));
    
    effective_thrust = sampleData.thr;
    projected_force = zeros(3, length(az1_c));
    
    for i = 1:1:length(az1_c)
        B_aloc =  [az1_c(i) az2_c(i) 0; az1_s(i) az2_s(i) 1; d1*az1_s(i)-d1*az1_c(i) d2*az2_s(i)-d2*az2_c(i) d3];
        projected_force(:,i) = B_aloc * effective_thrust(:, i);
    end

    %% Initialization
    time = sampleData.t;
    force = sampleData.F;
    
    demanded_rotation = sampleData.ud;
    effective_rotation = sampleData.u;
    
    demanded_thrust = sampleData.thrd;
    
    demanded_angle = sampleData.alphad;
    effective_angle = sampleData.alpha;
    
    y = sampleData.y;
    xset = sampleData.xset;
    
    %% Position
    plot_fig = figure('visible', 'off');
    
    figure(1)
    subplot(3,1,1)
    plot(time, y(1,:), time, xset(1,:));
    title('Position (x)')
    xlabel('Time (s)')
    ylabel('Position (m)')
    legend('Real position', 'Demanded Position');
    grid minor
    
    subplot(3,1,2)
    plot(time, y(2,:), time, xset(2,:));
    title('Position (y)')
    xlabel('Time (s)')
    ylabel('Position (m)')
    legend('Real position', 'Demanded Position');
    grid minor
    
    subplot(3,1,3)
    plot(time, y(3,:), time, xset(3,:));
    title('Yaw')
    xlabel('Time (s)')
    ylabel('Yaw')
    legend('Real position', 'Demanded Position');
    grid minor
    
    set(gcf);
    path = strcat(strcat('C:\Users\Patrick\projects\le_data\plots\reg\Position_result.png'));
    saveas(gcf, path);
    
    %% Force Plots
    plot_fig = figure('visible', 'off');
    
    figure(2)
    subplot(3,1,1)
    plot(time, force(1,:), time, projected_force(1,:))
    title('Control force - Surge')
    xlabel('Time (s)')
    ylabel('Force (N)')
    legend('Demanded Force', 'Actual Force')
    grid minor
    
    subplot(3,1,2)
    plot(time, force(2,:), time, projected_force(2,:))
    title('Control force - Sway')
    xlabel('Time (s)')
    ylabel('Force (N)')
    legend('Demanded Force', 'Actual Force')
    grid minor
    
    subplot(3,1,3)
    plot(time, force(3,:), time, projected_force(3,:))
    title('Control force - Yaw')
    xlabel('Time (s)')
    ylabel('Force (N)')
    legend('Demanded Force', 'Actual Force')
    grid minor
    
    set(gcf);
    path = strcat(strcat('C:\Users\Patrick\projects\le_data\plots\reg\Force_result.png'));
    saveas(gcf, path);
    
    %% Rotation Plots
    plot_fig = figure('visible', 'off');
    
    subplot(3,1,1)
    plot(time, demanded_rotation(1,:), time, effective_rotation(1,:));
    title('Rotation - Azimute 1')
    xlabel('Time (s)')
    % qual a unidade
    ylabel('Rotation (rpm)')
    legend('Demanded Rotation', 'Effective Rotation');
    grid minor
    
    subplot(3,1,2)
    plot(time, demanded_rotation(2,:), time, effective_rotation(2,:));
    title('Rotation - Azimute 2')
    xlabel('Time (s)')
    % qual a unidade
    ylabel('Rotation (rpm)')
    legend('Demanded Rotation', 'Effective Rotation');
    grid minor
    
    subplot(3,1,3)
    plot(time, demanded_rotation(3,:), time, effective_rotation(3,:));
    title('Rotation - Proa')
    xlabel('Time (s)')
    % qual a unidade
    ylabel('Rotation (rpm)')
    legend('Demanded Rotation', 'Effective Rotation');
    grid minor
    
    set(gcf);
    path = strcat(strcat('C:\Users\Patrick\projects\le_data\plots\reg\Rotation_result.png'));
    saveas(gcf, path);
    
    %% Thrust Plots
    plot_fig = figure('visible', 'off');
    
    subplot(3,1,1)
    plot(time, demanded_thrust(1,:), time, effective_thrust(1,:));
    title('Thrust - Azimute 1')
    xlabel('Time (s)')
    % qual a unidade
    ylabel('Thrust (N)')
    legend('Demanded Thrust', 'Effective Thrust');
    grid minor
    
    subplot(3,1,2)
    plot(time, demanded_thrust(2,:), time, effective_thrust(2,:));
    title('Thrust - Azimute 2')
    xlabel('Time (s)')
    % qual a unidade
    ylabel('Thrust (N)')
    legend('Demanded Rotation', 'Effective Rotation');
    grid minor
    
    subplot(3,1,3)
    plot(time, demanded_thrust(3,:), time, effective_thrust(3,:));
    title('Rotation - Proa')
    xlabel('Time (s)')
    % qual a unidade
    ylabel('Thrust (N)')
    legend('Demanded Rotation', 'Effective Rotation');
    grid minor
    
    set(gcf);
    path = strcat(strcat('C:\Users\Patrick\projects\le_data\plots\reg\Thrust_result.png'));
    saveas(gcf, path);
    
    %% Angle
    plot_fig = figure('visible', 'off');
    subplot(3,1,1)
    plot(time, demanded_angle(1,:), time, effective_angle(1,:));
    title('Angle - Azimute 1')
    xlabel('Time (s)')
    ylabel('Angle')
    legend('Demanded Angle', 'Effective Angle');
    grid minor
    
    subplot(3,1,2)
    plot(time, demanded_angle(2,:), time, effective_angle(2,:));
    title('Thrust - Azimute 2')
    xlabel('Time (s)')
    ylabel('Angle')
    legend('Demanded Angle', 'Effective Angle');
    grid minor
    
    subplot(3,1,3)
    plot(time, demanded_angle(3,:), time, effective_angle(3,:));
    title('Rotation - Proa')
    xlabel('Time (s)')
    ylabel('Angle')
    legend('Demanded Angle', 'Effective Angle');
    grid minor
    
    set(gcf);
    path = strcat(strcat('C:\Users\Patrick\projects\le_data\plots\reg\Angle_result.png'));
    saveas(gcf, path);