function filtered = bpo(signal)
%BPO Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.13 and DSP System Toolbox 9.15.
% Generated on: 18-Jan-2024 11:23:59

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 96000;  % Sampling Frequency

Fstop1 = 23500;           % First Stopband Frequency
Fpass1 = 24500;           % First Passband Frequency
Fpass2 = 29500;           % Second Passband Frequency
Fstop2 = 30500;           % Second Stopband Frequency
Dstop1 = 0.001;           % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.001;           % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

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
