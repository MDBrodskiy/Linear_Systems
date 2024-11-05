% Written by Michael Brodskiy
% Fundamentals of Linear Systems
% I. Salama

clear all; % Clear Workspace

delta = @(n) (n == 0); % Define the unit impulse function
u = @(n) (n >= 0); % Define the unit step function

%% Question 1

n = [0:12]; % Define the range of n
x = u(n-1) - u(n-4); % Define the function given as x
h = u(n-5) - u(n-11); % Define the given step response as h

%%% Part A

subplot(3,1,1); % Create subplots
stem(n,x,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('x[n]'); % Define $$y$$-axis title
ylim([0 2]); % Define vertical axis limits

subplot(3,1,2); % Create subplots
stem(n,h,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('h[n]'); % Define $$y$$-axis title
ylim([0 2]); % Define vertical axis limits

%%% Part B

y = conv(x,h);
ny = [0:24];

subplot(3,1,3);
stem(ny,y,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('y[n]'); % Define $$y$$-axis title
ylim([0 4]);

%%% Part C

% The result computed in Part B above matches the calculations made in PS3-4

%%% Part D

% We may observe that the delay in y[n] is, indeed n = 5. We see that the signal
% was spread over a time period double that of the original (n goes from 0-12 to
% 0-24). Furthermore, the peak values of the signal were tripled, and the signal
% itself has non-sero value for 8 values of n instead of 3 or 6.

clear all; % Clear Plots

delta = @(n) (n == 0); % Define the unit impulse function
u = @(n) (n >= 0); % Define the unit step function
n = [0:12]; % Define the range of n
x = u(n-1) - u(n-4); % Define the function given as x

%%% Part E

h2 = u(n) - u(n-2);

subplot(3,1,1); % Create subplots
stem(n,x,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('x[n]'); % Define $$y$$-axis title
ylim([0 2]); % Define vertical axis limits

subplot(3,1,2); % Create subplots
stem(n,h2,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('h[n]'); % Define $$y$$-axis title
ylim([0 2]); % Define vertical axis limits

y = conv(x,h2);
ny = [0:24];

subplot(3,1,3);
stem(ny,y,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('y[n]'); % Define $$y$$-axis title
ylim([0 4]);

% Using the above, we see that the delay is now only n = 1, though the signal 
% still occupies a timespace double that of the original two signals. Finally, 
% the peak values of the signal are double those of the original ones, and the
% convolved signal extends over 4 values, instead of 3 or 2

clear all; % Clear Plots

delta = @(n) (n == 0); % Define the unit impulse function
u = @(n) (n >= 0); % Define the unit step function
n = [0:12]; % Define the range of n
x = u(n-1) - u(n-4); % Define the function given as x

%%% Part F

h3 = u(n) - u(n-1);

subplot(3,1,1); % Create subplots
stem(n,x,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('x[n]'); % Define $$y$$-axis title
ylim([0 2]); % Define vertical axis limits

subplot(3,1,2); % Create subplots
stem(n,h3,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('h[n]'); % Define $$y$$-axis title
ylim([0 2]); % Define vertical axis limits

y = conv(x,h3);
ny = [0:24];

subplot(3,1,3);
stem(ny,y,'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('y[n]'); % Define $$y$$-axis title
ylim([0 4]);

% We may observe that, with these values, the convolved signal is the x[n]
% signal, since this convolution follows the property of convolution that, when 
% a signal is convolved with the delta function, it remains unchanged. Thus, we 
% may say y3[n]=x[n].

%% Question 2

clear all; % Clear Workspace

delta = @(t) (t == 0); % Define the unit impulse function
u = @(t) (t >= 0); % Define the unit step function

t = [0:.01:5]; % Define timespace

x = u(t-2) - u(t-4); % Define the given function x
h = 5 * exp(-5 * t); % Define the given impulse response

%%% Part A

y = conv(x,h); % Convolve the functions
ty = [0:.01:10];

subplot(3,1,1); % Create subplots
plot(t,x); % Plot figure
ylabel('x(t)'); % Define $$y$$-axis title
ylim([0 2]);

subplot(3,1,2); % Create subplots
plot(t,h); % Plot figure
ylabel('h(t)'); % Define $$y$$-axis title
ylim([0 6]);

subplot(3,1,3); % Create subplots
plot(ty,y); % Plot figure
xlabel('t'); % Define $$x$$-axis title
ylabel('y(t)'); % Define $$y$$-axis title

% Using the above plots, we may observe that this is, indeed what we would
% expect a response from a low pass filter would. We see that it "charges" the
% capacitor and maintains a maximum value while the signal is active, and then
% begins to "discharge" when the signal ends.

%%% Part B

clear all; % Clear workspace

delta = @(t) (t == 0); % Define the unit impulse function
u = @(t) (t >= 0); % Define the unit step function

t = [0:.01:5]; % Define timespace

x = u(t-2) - u(t-4); % Define the given function x
h2 = 8 * exp(-8 * t); % Define the first given impulse response
h3 = 10 * exp(-10 * t); % Define the second given impulse response

y2 = conv(x,h2); % Convolve the functions
ty = [0:.01:10];

subplot(3,1,1); % Create subplots
plot(t,x); % Plot figure
ylabel('x(t)'); % Define $$y$$-axis title
ylim([0 2]);

subplot(3,1,2); % Create subplots
plot(t,h2); % Plot figure
ylabel('h(t)'); % Define $$y$$-axis title
ylim([0 9]);

subplot(3,1,3); % Create subplots
plot(ty,y2); % Plot figure
xlabel('t'); % Define $$x$$-axis title
ylabel('y(t)'); % Define $$y$$-axis title

y3 = conv(x,h3); % Convolve the functions

subplot(3,1,1); % Create subplots
plot(t,x); % Plot figure
ylabel('x(t)'); % Define $$y$$-axis title
ylim([0 2]);

subplot(3,1,2); % Create subplots
plot(t,h3); % Plot figure
ylabel('h(t)'); % Define $$y$$-axis title
ylim([0 11]);

subplot(3,1,3); % Create subplots
plot(ty,y3); % Plot figure
xlabel('t'); % Define $$x$$-axis title
ylabel('y(t)'); % Define $$y$$-axis title

% We may observe that changing the critical frequency causes the impulse
% response to begin from a point where the value of the function is equal to the
% critical frequency. Furthermore, we see that the height of y(t) is related to 
%the critical frequency. That is, the maximum attainable value of y(t) is 
% greater when the critical frequency is greater.

%%% Part C

clear all; % Clear workspace

delta = @(t) (t == 0); % Define the unit impulse function
u = @(t) (t >= 0); % Define the unit step function

t = [0:.01:5]; % Define timespace

x = u(t-2) - u(t-4); % Define the given function x
h4 = 4 * exp(-4 * t); % Define the first given impulse response
h5 = 2 * exp(-2 * t); % Define the second given impulse response

y4 = conv(x,h4); % Convolve the functions
ty = [0:.01:10];

subplot(3,1,1); % Create subplots
plot(t,x); % Plot figure
ylabel('x(t)'); % Define $$y$$-axis title
ylim([0 2]);

subplot(3,1,2); % Create subplots
plot(t,h4); % Plot figure
ylabel('h(t)'); % Define $$y$$-axis title
ylim([0 5]);

subplot(3,1,3); % Create subplots
plot(ty,y4); % Plot figure
xlabel('t'); % Define $$x$$-axis title
ylabel('y(t)'); % Define $$y$$-axis title

y5 = conv(x,h5); % Convolve the functions

subplot(3,1,1); % Create subplots
plot(t,x); % Plot figure
ylabel('x(t)'); % Define $$y$$-axis title
ylim([0 2]);

subplot(3,1,2); % Create subplots
plot(t,h5); % Plot figure
ylabel('h(t)'); % Define $$y$$-axis title
ylim([0 3]);

subplot(3,1,3); % Create subplots
plot(ty,y5); % Plot figure
xlabel('t'); % Define $$x$$-axis title
ylabel('y(t)'); % Define $$y$$-axis title

% From the above plots, we may observe that h(t) starting values decrease when
% the critical frequency is decreased. Furthermore, we see that the maximum
% height of y(t) is not only lesser, but also it takes longer for the circuit
% capacitor to "charge" to its maximum value.