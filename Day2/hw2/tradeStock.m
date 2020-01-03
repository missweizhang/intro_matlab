%% Optional Problem 11 Buy and sell a stock

function endValue = tradeStock(initialInvestment, price, buy, sell, doPlot)

if nargin < 5 % default argument
    doPlot = 0;
end

N = length(price);
TRANSACTION_COST = 12.95;

% make sure input makes sense
assert( isequal( intersect(buy, 1:N), buy) );
assert( isequal( intersect(sell, 1:N), sell) );
assert( isempty( intersect(buy, sell) ) );

% initial values
shares = 0;
pricePaid = 0;
cash = initialInvestment;
disp(['Initial investment = ', num2str(initialInvestment) ]);

% record time vectors for plotting
sharesAcquiredVector = zeros(1,N);
cashVector = zeros(1,N) + cash;
valueVector = cashVector;

for t = 1:N
    if ismember(t, buy)
        sharesToBuy = floor( ( cash - TRANSACTION_COST ) / price(t) );
        if sharesToBuy > 0
            % buy as many shares as possible
            sharesAcquiredVector(t) = sharesToBuy;
            cash = cash - TRANSACTION_COST - sharesToBuy * price(t);
            shares = shares + sharesToBuy;
            pricePaid = price(t);
            disp( compose(['t=%d, bought %d share(s) at price = %.2f per share.', ...
                ' shares = %d, cash = %.2f'], ...
                t, sharesAcquiredVector(t), price(t), shares, cash) );
        end
    elseif ismember(t, sell) && shares > 0
        profit = ( price(t) - pricePaid ) * shares;
        cashIfSoldAll = cash - TRANSACTION_COST + price(t) * shares;
        if profit > TRANSACTION_COST
            assert( cashIfSoldAll > 0 );
            
            % sell all shares
            sharesAcquiredVector(t) = -shares;
            cash = cashIfSoldAll;
            shares = 0;
            disp( compose(['t=%d, sold %d share(s) at price = %.2f per share.', ...
                ' shares = %d, cash = %.2f'], ...
                t, -sharesAcquiredVector(t), price(t), shares, cash) );
        end
    end
    
    cashVector(t) = cash;
    valueVector(t) = cash + shares * price(t);
end

endValue = cash + shares * price(length(price));
disp(['End value = ', num2str(endValue) ]);

if doPlot
    figure;
    
    yyaxis left;
    plot(1:N, price, 'DisplayName', 'Google');
    ylabel('price');
    xlabel('time');

    yyaxis right;
    plot(1:N, valueVector / initialInvestment * 100, ...
         'DisplayName', '% Portfolio Value');
    ylabel('%Value');
    
    title('Buy and sell stock');
    legend('Location', 'northwest');
end

end