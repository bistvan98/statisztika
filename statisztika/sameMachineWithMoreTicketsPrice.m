function [results, occurenceOfNumbers] = sameMachineWithMoreTicketsPrice()
    % A sameMachineWithMoreTickets függvény meghívása, visszatérési
    % értékének mentése (y) - szelvények száma, nyertes szelvények száma
    % (2, 3, 4, 5), nem nyert szelvények
    [results, occurenceOfNumbers] = sameMachineWithMoreTickets();

    % Az 5-ös lottó nyereményei 2022. 2. héten. A számítások ezeken az adatokon
    % alapulnak
    oneTicketCost = 300;
    twoNumbersPrize = 1985;
    threeNumbersPrize = 18935;
    fourNumbersPrize = 1410950;
    fiveNumbersPrize = 3348134835;

    % A teszteslés során összegyűlt költségek és nyeremények meghatározása
    allTicketCost = results(1) * oneTicketCost;
    allTwoNumberPrize = results(3) * twoNumbersPrize;
    allThreeNumberPrize = results(4) * threeNumbersPrize;
    allFourNumberPrize = results(5) * fourNumbersPrize;
    allFiveNumberPrize = results(6) * fiveNumbersPrize;
    
    % A költségek, nyeremények, illetve a nyereség / veszteség ismeretetése
    fprintf('\nA szelvényekre költött pénz: %d \n', allTicketCost);
    fprintf('A két szám eltalálásáért nyert összeg: %d \n', allTwoNumberPrize);
    fprintf('A három szám eltalálásáért nyert összeg: %d \n', allThreeNumberPrize);
    fprintf('A négy szám eltalálásáért nyert összeg: %d \n', allFourNumberPrize);
    fprintf('A öt szám eltalálásáért nyert összeg: %d \n', allFiveNumberPrize);
    fprintf('Végső nyereség / veszteség: %d \n', (allTwoNumberPrize + allThreeNumberPrize + allFourNumberPrize + allFiveNumberPrize) - allTicketCost);
end
