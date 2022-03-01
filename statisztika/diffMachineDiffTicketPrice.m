function [results] = diffMachineDiffTicketPrice()
    % A diffMachineDiffTicket függvény meghívása, visszatérési
    % értékének mentése (y) - szelvények száma, nyertes szelvények száma
    % (2, 3, 4, 5), nem nyert szelvények
    [y] = diffMachineDiffTicket();
    results = y;

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
    fprintf('\nA szelvenyekre koltott penz: %d \n', allTicketCost);
    fprintf('A ket szam eltalalasaert nyert osszeg: %d \n', allTwoNumberPrize);
    fprintf('A harom szam eltalalasaert nyert osszeg: %d \n', allThreeNumberPrize);
    fprintf('A negy szam eltalalasaert nyert osszeg: %d \n', allFourNumberPrize);
    fprintf('A ot szam eltalalasaert nyert osszeg: %d \n', allFiveNumberPrize);
    fprintf('Vegso nyereseg / veszteseg: %d \n', (allTwoNumberPrize + allThreeNumberPrize + allFourNumberPrize + allFiveNumberPrize) - allTicketCost);
end
