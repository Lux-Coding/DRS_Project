clear all;
close all;

% start parameter
NOptimal = 1000;                        % points for "optimal" sine
Bincrement   = 20;                       % Bitwidth of phase increment
NTable = 2^Bincrement;       % Number of values reserved for lookup table
IncrementLSB = 2^(-(Bincrement - 1));
fs = 96000;                                 % sampling frequency

% Calculate possible frequency
desiredF = 40000;
frequencies = frealizable(Bincrement, fs, 0);
minDiff = min(abs(frequencies - desiredF));
for i = 1:length(frequencies)
    if abs(frequencies(i) - desiredF) == minDiff
        f = frequencies(i);
    end
end

fprintf('Gewünschte Frequenz: %f\n', desiredF);
fprintf('Tatsächliche Frequenz (geringste Abweichung von gewünschter f): %f\n', f);
fprintf('Abweichung: %f %%\n', abs(f - desiredF) * 100 / desiredF);