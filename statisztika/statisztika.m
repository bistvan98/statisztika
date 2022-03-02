% A program az 5-ös lottót vizsgálja három módon:
%
% 1) Mennyi esélye van egy játékosnak 2-es, 3-as, 4-es és 5-ös találatra egy szelvénnyel? Egy vizsgálat menete: 
%   A gép húz 5 random, nem ismétlődő számot 1 és 90 között, illetve a játékos is választ 5 random, nem
%   ismétlődő számot 1 és 90 között minden egyes vizsgálatkor
% 2) Mennyi esélye van egy játékosnak 2-es, 3-as, 4-es és 5-ös találatra X
%   szelvénnyel? Egy vizsgálat menete: A gép húz 5 random, nem ismétlődő
%   számot 1 és 90 között, a játékos pedig X alkalommal választ 5 random, nem
%   ismétlődő számot ugyanahhoz a szelvényhez.
% 3) Ugyanazok a számok más-más nyerő számokkal.
% 4) Kiszámolja, hogy az 1)-es vizsgálat esetén X húzás után hány forintot
%   nyert a játékos, illetve hány forintot költött el szelvényekre.
% 5) Kiszámolja, hogy a 2)-es vizsgálat esetén X szelvény vásárlásával hány
%   forintot nyer a játékos 1 húzás esetén, illetve hány forintot költött el szelvényekre.
% 6) Kiszámolja, hogy a 3)-as vizsgálat esetén X szelvény vásárlásával hány
%   forintot nyert a játékos, illetve mennyit költött szelvényekre. 
% 7) Az első három tesztesetet alapul véve addig generál eseteket, amíg nem
%   lesz egy 5-9s találat, majd az ebből kapott adatokat sszefoglalja.
% 8) Diagram segítségével ábrázolja az előfordult számokat.
% 9) A meglévő adatok felhasználásával statisztikákat jelenít meg.

clear all

% Használt változók
allTests = zeros(1, 6); % A szelvények adatai
allTestsTemp = zeros(1, 6); % Ideiglenes tárolása aszelvények adatainak
occurenceOfNumbers = zeros(1, 90); % A kihúzott számok előfordulását tárolja
occurenceOfNumbersTemp = zeros(1, 90); % Ideiglenes tárolása a kihúzott számoknak

oneTicketCost = 300; % Egy lottó szelvény ára
twoNumbersPrize = 1985; % Két találatos nyeremény
threeNumbersPrize = 18935; % Három találatos nyeremény
fourNumbersPrize = 1410950; % Négy találatos nyeremény
fiveNumbersPrize = 3348134835; % Öt találatos nyeremény

% A program addig fut, amíg a felhasználó ki nem lép (0)
while 1
    disp(' ');
    choose = input('Melyik tesztet szeretné végrehajtani? (1/2/3/4/5/6/7 - tesztek, 8 - számok előfordulása, 9 - eddigi adatok összesítve, 0 - kilépés): ');
    % Ha a felhasználó 0-t ad meg, akkor a program leáll
    if(choose == 0)
        break; 
    % Ha a felhasználó 1-est ad meg, akkor a program az első tesztesetet
    % fogja lefuttatni
    elseif(choose == 1)
        disp('///// Első teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = diffMachineDiffTicket();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');
        
    % 2-es teszteset
    elseif(choose == 2)
        disp('///// Második teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = sameMachineWithMoreTickets();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');  
        
    % 3-as teszteset
    elseif(choose == 3)
        disp('///// Harmadik teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = diffMachineSameTicket();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');  
        
    % 4-es teszteset
    elseif(choose == 4)
        disp('///// Negyedik teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = diffMachineDiffTicketPrice();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');
        
    % 5-ös teszteset
    elseif(choose == 5)
        disp('///// Ötödik teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = sameMachineWithMoreTicketsPrice();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');
        
    % 6-os teszteset    
    elseif(choose == 6)
        disp('///// Hatodik teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = diffMachineSameTicketPrice();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');
        
    % 7-es teszteset    
    elseif(choose == 7)    
        disp('///// Hetedik teszt vizsgálata \\\\\')
        [allTestsTemp, occurenceOfNumbersTemp] = waitForFive();
        occurenceOfNumbers = occurenceOfNumbers + occurenceOfNumbersTemp;
        occurenceOfNumbersTemp = zeros(1, 90);
        allTests = allTests + allTestsTemp;
        allTestsTemp = zeros(1, 6);
        disp(' ');
        
    % Számok előfordulása    
    elseif(choose == 8)
        disp('///// A kihúzott számok előfordulása az eddigi tesztekben: \\\\\')
        t = 1:1:90;
        plot(t, occurenceOfNumbers)
        disp(' ')
        
    % Adatok összesítve
    elseif(choose == 9)
        disp('///// Eddigi tesztek eredményei: \\\\\')
        
        disp('///// Szelvény adatok: \\\\\');
        allTests
        
        disp('///// Összes költség, nyereség: \\\\\');
        
        disp('Szelvények költsége: ');
        cost = allTests(1) * oneTicketCost
        
        disp('// Összes szelvény: \\');
        fprintf('%d\n', allTests(1));
        
        disp('// Összes nem nyert szelvény: \\');
        fprintf('%d\n', allTests(2));
        
        disp('// Két találatos nyeremény: \\');
        two = allTests(3) * twoNumbersPrize;
        fprintf('%d, %d darab\n', two, allTests(3));
        
        disp('// Három találatos nyeremény: \\');
        three = allTests(4) * threeNumbersPrize;
        fprintf('%d, %d darab\n', three, allTests(4));
        
        disp('// Négy találatos nyeremény: \\');
        four = allTests(5) * fourNumbersPrize;
        fprintf('%d, %d darab\n', four, allTests(5));
        
        disp('// Öt találatos nyeremény: \\');
        five = allTests(6) * fiveNumbersPrize;
        fprintf('%d, %d darab\n', five, allTests(6));
        
        disp('// Összes nyeremény: \\');
        allPrize = two + three + four + five;
        fprintf('%d\n', allPrize);
        
        disp('// Eddigi nyereség / veszteség: \\');
        fprintf('%d\n', allPrize - cost);
        
        onePercentage = allTests(1) / 100;      
        disp('// Találatok százalékban: \\');
        disp(' ');
        
        for k = 2:5
            fprintf('%d találat: ', k);
            if(allTests(k + 1) == 0)
                disp('0 %');
                disp(' ');
            else
               percentageResult = allTests(k + 1) / onePercentage;
               fprintf('%.4f %%\n\n', percentageResult);
            end
        end
        
        bar(allTests)
        set(gca,'xticklabel',{'Összes', 'Nem nyert', 'Kettő', 'Három', 'Négy', 'Öt'})
        set(gcf,'position',[100,100,800,650])
        
        disp(' ');
        
    % Nem megfelelő érték megadása esetén újra meg kell adni egyet
    else
        disp('Ezt a számot nem adhatja meg! Adjon meg egy új számot! ');
    end
end
