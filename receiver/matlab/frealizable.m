function y = frealizable(wordlength, fs, display)

increment = 2^(-(wordlength-1));
increments = increment:increment:1-increment;
y = fs / 2 * increments;

if display
    disp('Phaseninkrement:     Frequenz:');
    for i = 1:length(y)
        fprintf('%.6f             %f\n', increments(i), y(i));
    end
end