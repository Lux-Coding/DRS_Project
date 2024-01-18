close all;

% Precision of DDS:
DDSPrecison = 0.05;

fs = 96000;
Ts = 1 / fs;
N = 10;
fu = 40000.030518;
fo = 27000;
samplesPerBit = 341;
T_symb = Ts * samplesPerBit;
N_symb = samplesPerBit;

% Erzeugung zweier freilaufender Oszillatorschwingungen
t = 0:Ts:N*T_symb-Ts;
NPoints = length(t);
oszillator_1 = cos(2*pi*fu*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;
oszillator_2 = cos(2*pi*fo*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;

% ****************** sender ***********************
% Erzeugung einer Anzahl (N) zufälliger Datenbits
data_transmit = round(rand(1,N));
% Erzeugung des Sendesignals
s = [];
datasignal = [];
for k = 1:N
    if data_transmit(k) == 0
        s = [s, oszillator_1((k-1)*samplesPerBit+1:k*samplesPerBit)];
        datasignal = [datasignal zeros(1,N_symb)];
    else
        s = [s, oszillator_2((k-1)*samplesPerBit+1:k*samplesPerBit)];
        datasignal = [datasignal ones(1,N_symb)];
    end
end

bpFilteredO = bpo(s);
bpFilteredU = bpu(s);

absBpFilteredO = abs(bpFilteredO);
absBpFilteredU = abs(bpFilteredU);

combinedSignal = absBpFilteredO - absBpFilteredU;

plot(t, datasignal, t, s);
figure;
plot(t, bpFilteredO, t, bpFilteredU);
figure;
plot(t, absBpFilteredO, t, absBpFilteredU);
figure;
plot(t, combinedSignal);

% tpFiltered = filter(tp().Numerator, 1, combinedSignal);
tpFiltered = tp(combinedSignal);

% tp_coeff = tp().Numerator;

figure;
plot(tpFiltered);

