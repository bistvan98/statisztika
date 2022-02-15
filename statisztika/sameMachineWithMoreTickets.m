function [y] = sameMachineWithMoreTickets()
    disp('///// Masodik teszt vizsgalata \\\\\')

    % A találatokat tároló változók
    notWon = 0;
    twoNumbers = 0;
    threeNumbers = 0;
    fourNumbers = 0;
    fiveNumbers = 0;

    % Hány húzást vizsgáljon a program?
    numberOfTests = input('Hany esetet vizsgaljon a program? ');

    % Kiírja az összes esetet vagy csak a nyertes szelvényeket?
    while 1
        needAll = input('Kiirja a program az osszes esetet (1) vagy csak a nyertes szelvenyeket (2)? ');
        if(needAll == 1 || needAll == 2)
            break; 
        else
            disp('Csak az 1 (minden adat) es a 2 (csak nyertes) valasz adahto meg!' );
        end
    end

    disp(' ');

    % 5 random, nem ismétlődő szám generálása 1 és 90 között a gép részére
    machineNumbers = randperm(90,5);

    for i = 1:numberOfTests
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
                    disp('A gep altal kihuzott szamok: ');
                    disp(machineNumbers);
                
                    % A játékos által választott számok kiírása
                    disp('A jatekos altal valasztott szamok: ');
                    disp(playerNumbers);
                end
            case 1
                notWon = notWon + 1;
                if(needAll == 1)
                    % A gép által kihúzott számok kiírása
                    disp('A gep altal kihuzott szamok: ');
                    disp(machineNumbers);
                
                    % A játékos által választott számok kiírása
                    disp('A jatekos altal valasztott szamok: ');
                    disp(playerNumbers);
                end
            case 2
                twoNumbers = twoNumbers + 1;          
                disp('///// 2 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gep altal kihuzott szamok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A jatekos altal valasztott szamok: ');
                disp(playerNumbers);
            case 3
                threeNumbers = threeNumbers + 1;
                disp('///// 3 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gep altal kihuzott szamok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A jatekos altal valasztott szamok: ');
                disp(playerNumbers);
            case 4
                fourNumbers = fourNumbers + 1;
                disp('///// 4 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gep altal kihuzott szamok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A jatekos altal valasztott szamok: ');
                disp(playerNumbers);
            case 5
                fiveNumbers = fiveNumbers + 1;
            
                disp('///// 5 \\\\\');
                disp(' ');
            
                % A gép által kihúzott számok kiírása
                disp('A gep altal kihuzott szamok: ');
                disp(machineNumbers);
                
                % A játékos által választott számok kiírása
                disp('A jatekos altal valasztott szamok: ');
                disp(playerNumbers);
        end
    end

    % A vizsgálatok után keletkezett adatok kiírása
    disp('A vegeredmeny: ');
    disp(' ');
    disp('Osszesen jatszott jatekok szama: ');
    disp(numberOfTests);
    disp('Nem nyert szelvenyek szama: ');
    disp(notWon);
    disp('2 talaltos szelvenyek szama: ');
    disp(twoNumbers);
    disp('3 talalatos szelvenyek szama: ');
    disp(threeNumbers);
    disp('4 talalatos szelvenyek szama: ');
    disp(fourNumbers);
    disp('5 talalatos szelvenyek szama: ');
    disp(fiveNumbers);

    % Annak az esélye, hogy a játékos nyerni tud
    winningChance = ((twoNumbers + threeNumbers + fourNumbers + fiveNumbers)/numberOfTests) * 100;
    fprintf('Esely ahhoz, hogy nyerjen a jatekos: %.4f %% ', winningChance);
    
    % A teszt során használt adatok összegyűjtése
    y = zeros(1,6);
    y(1) = numberOfTests;
    y(2) = notWon;
    y(3) = twoNumbers;
    y(4) = threeNumbers;
    y(5) = fourNumbers;
    y(6) = fiveNumbers;

    % Oszlpdiagram készítése
    bar(y)
    set(gca,'xticklabel',{'Osszes', 'Nem nyert', 'Ketto', 'Harom', 'Negy', 'Ot'})
    set(gcf,'position',[100,100,800,650])
end