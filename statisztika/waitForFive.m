function [y, occurenceOfNumbers] = waitForFive()
    correctNumber = 0;
    while(correctNumber == 0)
        n = input('Melyik tesztesethez vizsgálja? (1/2/3): ');
        if(n == 1 || n == 2 ||n == 3)
            correctNumber = 1;
        else
            disp('Nem megfelelő szám, adja meg mégegyszer! ');
            disp(' ');
        end
    end
    
    foundFive = 0;
    steps = 0;
    notWon = 0;
    twoNumbers = 0;
    threeNumbers = 0;
    fourNumbers = 0;
    fiveNumbers = 0;
    % A számok előfordulását menti
    occurenceOfNumbers = zeros(1, 90);
    
    switch n
        case 1
            disp('Különböző nyerő számok - különböző játszott számok: ');
            disp(' ');
            while(foundFive == 0)
                steps = steps + 1;
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
                        
                    case 1
                        notWon = notWon + 1;
                        
                    case 2
                        twoNumbers = twoNumbers + 1;
            
                    case 3
                        threeNumbers = threeNumbers + 1;
            
                    case 4
                        fourNumbers = fourNumbers + 1;
            
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
                        
                        fprintf('\nAz 5-ös találathoz %d szelvényre volt szükség.', steps);
                        
                        foundFive = 1;
                end
            end
            
        case 2
            disp('Ugyanazok a nyerő számok - több szelvény: ');
            disp(' ');
            
            machineNumbers = randperm(90,5);
            disp('A nyerő számok: ');
            machineNumbers
            disp(' ');
            
            % A kihúzott számok előfordulását elmenti
            for k = 1:5
                occurenceOfNumbers(machineNumbers(k)) = occurenceOfNumbers(machineNumbers(k)) + 1;
            end
            
            while(foundFive == 0)
                steps = steps + 1;
                playerNumbers = randperm(90,5);
                correctNumbers = 0;
                
                for j = 1:5
                    for k = 1:5
                        if(playerNumbers(j) == machineNumbers(k))
                            correctNumbers = correctNumbers + 1;
                        end
                    end
                end
                
                switch correctNumbers
                    case 0  
                        notWon = notWon + 1;
                        
                    case 1
                        notWon = notWon + 1;
                        
                    case 2
                        twoNumbers = twoNumbers + 1;
            
                    case 3
                        threeNumbers = threeNumbers + 1;
            
                    case 4
                        fourNumbers = fourNumbers + 1;
            
                    case 5
                        fiveNumbers = fiveNumbers + 1;
            
                        disp('///// 5 \\\\\');
                        disp(' ');
            
                        disp('A gép által kihúzott számok: ');
                        disp(machineNumbers);
                
                        disp('A játékos által választott számok: ');
                        disp(playerNumbers);
                        
                        fprintf('\nAz 5-ös találathoz %d szelvényre volt szükség.', steps);
                        
                        foundFive = 1;
                end
            end
            
        case 3
            disp('Külöböző nyerő számok - ugyanazok a játszott számok: ');
            disp(' ');
            
            playerNumbers = randperm(90,5);
            disp('A játékos számai: ')
            playerNumbers
            disp(' ');
            
            while(foundFive == 0)
                steps = steps + 1;
                machineNumbers = randperm(90,5);
                
                for k = 1:5
                    occurenceOfNumbers(machineNumbers(k)) = occurenceOfNumbers(machineNumbers(k)) + 1;
                end
                
                correctNumbers = 0;
                
                for j = 1:5
                    for k = 1:5
                        if(playerNumbers(j) == machineNumbers(k))
                            correctNumbers = correctNumbers + 1;
                        end
                    end
                end
                
                switch correctNumbers
                    case 0  
                        notWon = notWon + 1;
                        
                    case 1
                        notWon = notWon + 1;
                        
                    case 2
                        twoNumbers = twoNumbers + 1;
            
                    case 3
                        threeNumbers = threeNumbers + 1;
            
                    case 4
                        fourNumbers = fourNumbers + 1;
            
                    case 5
                        fiveNumbers = fiveNumbers + 1;
            
                        disp('///// 5 \\\\\');
                        disp(' ');
            
                        disp('A gép által kihúzott számok: ');
                        disp(machineNumbers);
                
                        disp('A játékos által választott számok: ');
                        disp(playerNumbers);
                        
                        fprintf('\nAz 5-ös találathoz %d szelvényre volt szükség.', steps);
                        
                        foundFive = 1;
                end
                
            end
            
    end
    
    oneTicketCost = 300;
    twoNumbersPrize = 1985;
    threeNumbersPrize = 18935;
    fourNumbersPrize = 1410950;
    fiveNumbersPrize = 3348134835;
    
    % A teszt során használt adatok összegyűjtése
    y = zeros(1,6);
    y(1) = steps;
    y(2) = notWon;
    y(3) = twoNumbers;
    y(4) = threeNumbers;
    y(5) = fourNumbers;
    y(6) = fiveNumbers;
    
    allTicketCost = y(1) * oneTicketCost;
    allTwoNumberPrize = y(3) * twoNumbersPrize;
    allThreeNumberPrize = y(4) * threeNumbersPrize;
    allFourNumberPrize = y(5) * fourNumbersPrize;
    allFiveNumberPrize = y(6) * fiveNumbersPrize;
    fprintf('\nÖsszes nyeremény: %d\nÖsszes költség: %d', (allTwoNumberPrize + allThreeNumberPrize + allFourNumberPrize + allFiveNumberPrize), allTicketCost);
    fprintf('\nA két szám eltalálásáért nyert összeg: %d \n', allTwoNumberPrize);
    fprintf('A három szám eltalálásáért nyert összeg: %d \n', allThreeNumberPrize);
    fprintf('A négy szám eltalálásáért nyert összeg: %d \n', allFourNumberPrize);
    fprintf('A öt szám eltalálásáért nyert összeg: %d \n', allFiveNumberPrize);
    fprintf('Végső nyereség / veszteség: %d \n', (allTwoNumberPrize + allThreeNumberPrize + allFourNumberPrize + allFiveNumberPrize) - allTicketCost);
    
end

