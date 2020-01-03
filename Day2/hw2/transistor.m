%% Problem 9 Logical indexing and piecewise plots.

% Transistor I-V curves

Vds = 0:0.1:5; % drain source voltage

for Vgs = 0:5    % gate source voltage
    lin = Vds <= (Vgs - 1);    % saturation piece
    sat = ~lin .* ( Vgs > 1 ); % linear piece

    Ids = 50 * ( ( Vgs - 1) * Vds - Vds.^2 / 2 ) .* lin ...
        + 50 / 2 * (Vgs - 1)^2 * sat;
    plot(Vds, Ids, 'DisplayName', ['V_{GS} = ', num2str(Vgs), 'V']);
    hold on
end

hold off;

title('Transistor Drain Current');
xlabel('V_{DS} (V)');
ylabel('I_{DS} (µA)');
legend('Location', 'northwest');