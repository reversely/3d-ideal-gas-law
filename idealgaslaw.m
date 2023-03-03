% Set up the figure
clear;clc;close

h = 7; % Height in inches
w = 10; % Width in inches

% Variables
Rs = 287; % Ideal gas constant for dry air
v = logspace(-3,0,20); % Volume v (m^3/kg)
t = linspace(0,1000,20); % Temperature t (K)
[T, V] = meshgrid(t,v);
P = ((Rs*(T+273.15))./V)/(10^6); % Pressure P (MPa)

v3 = logspace(-3,0,40); % Volume v (m^3/kg) for graph 3
t3 = logspace(-3,10,50); % Temperature t (K)
[T3, V3] = meshgrid(t3,v3);
P3 = ((Rs*(T3+273.15))./V3)/(10^6);

v4 = logspace(-3,0,20); % Volume v (m^3/kg) for graph 4
t4 = logspace(0,3,50); % Temperature t (K)
[T4, V4] = meshgrid(t4,v4);
P4 = ((Rs*(T4+273.15))./V4)/(10^6);

figure('Units','Inches','Position',[ 0 0 w h ]);
set(gcf,'PaperSize', [ w h ],'PaperPositionMode', 'auto');
colormap(jet);

% Plot P-v-T
subplot(2,2,1)
surf(T,V,P)
set(gca,'YScale','log')
%set(gca,'XDir','reverse')
set(gca,'YDir','reverse')
%set(gca,'ZDir','reverse')
xlabel('T (Celsius)'), ylabel('v (m^3/kg)'), zlabel('P (MPa)');
zlim([0 50])
xticks([0 200 400 600 800 1000])
grid on;

...
% Plot T-P
subplot(2,2,2)
contourf(T,P,V, logspace(-3,-1,20));
% set(gca,'YScale','log')
% set(gca,'YDir','reverse')
xlabel('T (Celsius)'), ylabel('P (mPa)'), zlabel('P (MPa)');
c = colorbar;
c.Ticks = linspace(0,0.1,11);
ylim([0 50]);
c.Label.String = 'v (m^3/kg)';
grid on;

...
% Plot v-P
subplot(2,2,3)
contourf(V3,P3,T3, logspace(-3,3));
set(gca,'XScale','log')
xlabel('Volume v (m^3/kg)'), ylabel('P (mPa)'), zlabel('T');
c = colorbar;
ylim([0 50]);
c.Label.String = 'T (Celsius)';
grid on;
...
% Plot v-T
subplot(2,2,4)
contourf(V4,T4,P4, logspace(-3,2,20));
set(gca,'XScale','log')
% set(gca,'YDir','reverse')
xlabel('Volume v (m^3/kg)'), ylabel('T (Celsius)'), zlabel('P (mPa)');
c = colorbar;
c.Ticks = linspace(0,100,11);
c.Label.String = 'P (mPa)';
grid on;
...
% Print the figure
print('idealgas.png','-dpng','-r300')
