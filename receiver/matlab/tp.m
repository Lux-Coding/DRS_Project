function filtered = tp(signal)
%TP Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.13 and DSP System Toolbox 9.15.
% Generated on: 18-Jan-2024 11:37:42

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 96000;  % Sampling Frequency

Fpass = 500;             % Passband Frequency
Fstop = 2000;            % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.001;           % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);
% Set the arithmetic property.
set(Hd, 'Arithmetic', 'fixed', ...
    'CoeffWordLength', 16, ...
    'CoeffAutoScale', true, ...
    'Signed',         true, ...
    'InputWordLength', 16, ...
    'inputFracLength', 15, ...
    'FilterInternals',  'FullPrecision');
denormalize(Hd);

filtered = filter(Hd, signal);

% [EOF]