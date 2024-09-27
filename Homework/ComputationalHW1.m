clear; % Clear workspace

%%% Question 1

delta = @(n) (n == 0); % Define the unit impulse function, $$\delta[n]$$
u = @(n) ((n >= 0) & (rem(n,1) == 0)); % Define the unit step function, $$u[n]$$
a = .5; % Define exponential value
halfExp = @(n) (a).^(n-2) .* u(n) - (a).^(n-2) .* u(n-4); % Define the exponential function

n=-20:25; % Range of times to evaluate
x = @(n) halfExp(n) + delta(n-4) + delta(n-5) + delta(n-6); % Define $$x[n]$$ per the problem specifications

%% Part A, Plotting $$x[n]$$

subplot(2,2,1); % Create subplots
stem(n,x(n),'fill'); % Plot figure
xlabel('n'); % Define $$x$$-axis title
ylabel('x[n]'); % Define $$y$$-axis title
ylim([-2 5]); % Establish $$y$$ limits
xlim([-2 8]); % Establish $$x$$ limits

%% Part B, Plotting $$x[n-2]$$

subplot(2,2,2);
stem(n,x(n-2),'fill');
xlabel('n');
ylabel('x[n-2]');
ylim([-2 5]);
xlim([0 10]);

%% Part C, Plotting $$x[-2n-2]$$

subplot(2,2,3);
stem(n,x(-2*n-2),'fill');
xlabel('n');
ylabel('x[-2n-2]');
ylim([-2 5]);
xlim([-5 5]);

%% Part D, Plotting $$x\left[\frac{n}{3}-2\right]$$

subplot(2,2,4);
stem(n,x(n/3-2),'fill');
xlabel('n');
ylabel('x[(n/3)-2]');
ylim([-2 5]);
xlim([5 25]);
axes('visible', 'off', 'title', 'x[n] and variations' );

pause; % Wait for input before continuing to next question

clear all; % Clear the workspace

%%% Question 2

N = 4; % Define $$N$$ value
range = 0:4*N; % Define plotting range
x1 = @(m) 2*sin( (2*pi*m) / N) + cos( (6*pi*m) / N); % Define function 1
x2 = @(l) 2*sin( (6*l) / N) + cos( (18*l) / N); % Define function 2

% We can see from the functions that $$x_1$$ is periodic, since the fundamental period of the first function is $$N=4$$ and $$(N/3)m=4$$ for the second one, thus the least common multiple of the frequencies is 4
% We can see from the second function that $$x_2$$ is not periodic, since neither sinusoid contains $$\pi$$ in its period

subplot(2,1,1);
stem(range, x1(range), 'fill'); % Use stem to plot figure
ylim([-3 3]); % Set $$y$$-axis bounds
xlim([-1 4*N+1]); % Set $$x$$-axis bounds
ylabel('Function 1'); % Label $$y$$-axis

subplot(2,1,2);
stem(range, x2(range), 'fill');
ylim([-3 3]); % Set $$y$$-axis bounds
xlim([-1 4*N+1]); % Set $$x$$-axis bounds
xlabel('Question 2 Functions'); % Label $$x$$-axis
ylabel('Function 2');

% We can see that, indeed, no value in function 2 repeats (at least within this range); on the other hand $$x_1$$ repeats every 4 samples

pause; % Wait for input before continuing to next question

clear all; % Clear the workspace

%%% Question 3

q3Func = @(a,T,phi,t) (2 .* e.^(a * t) .* cos( (2 * pi * t) / T + phi));

%% Part A, a=0, T_o=10, \phi=0

subplot(3,1,1); % Create subplots for each plot
a = 0;
T = 10;
phi = 0;
t = 0:(5*T); % Define parameter variables for the function ($$a, T_o, \phi, t$$)
plot(t, q3Func(a,T,phi,t)); % Plot the function
title('Question 3 Functions'); % Title Graphs
ylabel('Function 1'); % Label y axis

%% Part B, a=0, T_o=10, \phi=-\frac{\pi}{4}

subplot(3,1,2); % Create subplots for each plot
a = 0;
T = 10;
phi = -(pi/4);
t = 0:(5*T); % Define parameter variables for the function ($$a, T_o, \phi, t$$)
plot(t, q3Func(a,T,phi,t)); % Plot the function
ylabel('Function 2'); % Label y axis

% We see that $$\phi$$ causes a phase shift of the signal. Because, in this case, it is negative, the signal shifts to the right by $$\pi/4$$

%% Part C, a=-.05, T_o=10, \phi=0

subplot(3,1,3); % Create subplots for each plot
a = -.05;
T = 10;
phi = 0;
t = 0:(5*T); % Define parameter variables for the function ($$a, T_o, \phi, t$$)
plot(t, q3Func(a,T,phi,t)); % Plot the function
ylabel('Function 3'); % Label y axis

% We see that $$a$$ is the attentuation factor. Since it is negative in this case, the signal attenuates as it goes on (gets weaker)

pause; % Wait for input before continuing to next question

clear all; % Clear the workspace

%%% Question 4

No = 3; % Define fundamental period
q4Func = @(n) 5 .* sin((2 * pi / No) * n + (pi / 4)); % Define function without $$k$$
q4FuncK = @(n,k) 5 .* sin((2 * pi * k / No) * n + (pi / 4)); % Define function with $$k$$
xlimits = 0:2*No; % Set $$x$$ limits

% Plotting the graphs
subplot(3,2,1);
stem(xlimits, q4Func(xlimits), 'fill');
ylabel('Function 1');
subplot(3,2,2);
stem(xlimits, q4FuncK(xlimits,1), 'fill');
ylabel('Function 2 (k=1)');
subplot(3,2,3);
stem(xlimits, q4FuncK(xlimits,2), 'fill');
ylabel('Function 3 (k=2)');
subplot(3,2,4);
stem(xlimits, q4FuncK(xlimits,3), 'fill');
ylabel('Function 4 (k=3)');
subplot(3,2,5);
stem(xlimits, q4FuncK(xlimits,4), 'fill');
ylabel('Function 5 (k=4)');
subplot(3,2,6);
stem(xlimits, q4FuncK(xlimits,5), 'fill');
ylabel('Function 6 (k=5)');

% We see that, for all values of $$k$$ that are not an integer multiple of $$N_o$$, the same plot is generated

% When $$k$$ is an integer multiple of $$N_o$$, the fundamental frequency becomes 1
