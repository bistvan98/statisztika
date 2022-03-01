function [y, occurenceOfNumbers] = diffMachineDiffTicket()
    % A találatokat tároló változók
    notWon = 0;
    twoNumbers = 0;
    threeNumbers = 0;
    fourNumbers = 0;
    fiveNumbers = 0;
    
    % A számok előfordulását menti
    occurenceOfNumbers = zeros(1, 90);
    
    % Hány húzást vizsgáljon a program?
    numberOfTests = input('Hány esetet vizsgáljon a program? ');
    
    % Kiírja az összes esetet vagy csak a nyertes szelvényeket?
    while 1
        needAll = input('Kiírja a program az összes esetet (1) vagy csak a nyertes szelvényeket (2)? ');
        if(needAll == 1 || needAll == 2)
            break; 
        else
            disp('Csak az 1 (minden adat) és a 2 (csak nyertes) válasz adahtó meg!' );
        end
    end

    disp(' ');

    for i = 1:numberOfTests
        % 5 random, nem ismétlődő szám generálása 1 és 90 között a gép részére
        machineNumbers = randperm(90,5);
        
        % A kihúzott számok előfordulását elmenti
        for k = 1:5
            occurenceOfNumbers(machineNumbers(k)) = occurenceOfNumbers(machineNumbers(k)) + 1;
        end
    
        % 5 random, nem ismétlődő szám generálása 1 és 90 között a játékos
        % részére
        playerNumbers = randperm(90,5);
    
        % Vizsgálat, hogy hány számot talált el a játékos
        correctNumbers = 0;
    
        % A játékos számait változtató ciklus
        for j = 1:5
            % A gép számait változtató ciklus
            for k = 1:5
                if(playerNumbers(j) == machineNumbers(k))
                correctNumbers = correctNumbers + 1;
                end
            end
        end
        
        switch correctNumbers
            case 0  
                notWon = notWon + 1;
                if(needAll == 1)
                    % A gép által kihúzott számok kiírása
                    disp('A gép által kihúzott számok: ');
                    disp(machineNumbers);
                
                    % A játékos által választott számok kiírása
                    disp('A játékos által választott számok: ');
                    disp(playerNumbers);
                end
            case 1
                notWon = notWon + 1;
                if(needAll == 1)
                    % A gép által kihúzott számok kiírása
                    disp('A gép által kihúzott számok: ');
                    disp(machineNumbers);
                
                    % A játékos által választott számok kiírása
                    disp('A játékos által választott számok: ');
                    disp(playerNumbers);
                end
            case 2
                twoNumbers = twoNumbers + 1;
            
                disp('///// 2 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gép által kihúzott számok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A játékos által választott számok: ');
                disp(playerNumbers);
            case 3
                threeNumbers = threeNumbers + 1;
            
                disp('///// 3 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gép által kihúzott számok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A játékos által választott számok: ');
                disp(playerNumbers);
            case 4
                fourNumbers = fourNumbers + 1;
            
                disp('///// 4 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gép által kihúzott számok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A játékos által választott számok: ');
                disp(playerNumbers);
            case 5
                fiveNumbers = fiveNumbers + 1;
            
                disp('///// 5 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gép által kihúzott számok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A játékos által választott számok: ');
                disp(playerNumbers);
        end
    end

    % A vizsgálatok után keletkezett adatok kiírása
    disp('A végeredmény: ');
    disp(' ');
    disp('Összesen játszott játékok száma: ');
    disp(numberOfTests);
    disp('Nem nyert szelvények száma: ');
    disp(notWon);
    disp('2 találtos szelvények száma: ');
    disp(twoNumbers);
    disp('3 találatos szelvények száma: ');
    disp(threeNumbers);
    disp('4 találatos szelvények száma: ');
    disp(fourNumbers);
    disp('5 találatos szelvények száma: ');
    disp(fiveNumbers);
    
    % Annak az esélye, hogy a játékos nyerni tud
    winningChance = ((twoNumbers + threeNumbers + fourNumbers + fiveNumbers)/numberOfTests) * 100;
    
    fprintf('Esély ahhoz, hogy nyerjen a játékos: %.4f %% \n', winningChance);
    fprintf('Esély ahhoz, hogy a játékosnak 2 találata legyen: %.4f %% \n', (twoNumbers / numberOfTests) * 100);
    fprintf('Esély ahhoz, hogy a játékosnak 3 találata legyen: %.4f %% \n', (threeNumbers / numberOfTests) * 100);
    fprintf('Esély ahhoz, hogy a játékosnak 4 találata legyen: %.4f %% \n', (fourNumbers / numberOfTests) * 100);
    fprintf('Esély ahhoz, hogy a játékosnak 5 találata legyen: %.4f %% \n', (fiveNumbers / numberOfTests) * 100);
    
    % A teszt során használt adatok összegyűjtése
    y = zeros(1,6);
    y(1) = numberOfTests;
    y(2) = notWon;
    y(3) = twoNumbers;
    y(4) = threeNumbers;
    y(5) = fourNumbers;
    y(6) = fiveNumbers;
    
    y
    
    % Oszlopdiagram készítése
    bar(y)
    set(gca,'xticklabel',{'Osszes', 'Nem nyert', 'Ketto', 'Harom', 'Negy', 'Ot'})
    set(gcf,'position',[100,100,800,650]) 
end
