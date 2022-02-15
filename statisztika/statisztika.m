% A program az 5-ös lottót vizsgálja három módon:
%
% 1) Mennyi esélye van egy játékosnak 2-es, 3-as, 4-es és 5-ös találatra egy szelvénnyel? Egy vizsgálat menete: 
%   A gép húz 5 random, nem ismétlődő számot 1 és 90 között, illetve a játékos is választ 5 random, nem
%   ismétlődő számot 1 és 90 között minden egyes vizsgálatkor
% 2) Mennyi esélye van egy játékosnak 2-es, 3-as, 4-es és 5-ös találatra X
%   szelvénnyel? Egy vizsgálat menete: A gép húz 5 random, nem ismétlődő
%   számot 1 és 90 között, a játékos pedig X alkalommal választ 5 random, nem
%   ismétlődő számot ugyanahhoz a szelvényhez.
% 3) Kiszámolja, hogy az 1)-es vizsgálat esetén X húzás után hány forintot
%   nyert a játékos, illetve hány forintot költött el szelvényekre.
% 4) Kiszámolja, hogy a 2)-es vizsgálat esetén X szelvény vásárlásával hány
%   forintot nyer a játékos 1 húzás esetén, illetve hány forintot költött el szelvényekre.

clear all

% A program addig fut, amíg a felhasználó ki nem lép (0)
while 1
    disp(' ');
    choose = input('Melyik tesztet szeretne vegrehajtani? (1/2/3/4 - tesztek 0 - kilepes): ');
    % Ha a felhasználó 0-t ad meg, akkor a program leáll
    if(choose == 0)
        break; 
    % Ha a felhasználó 1-est ad meg, akkor a program az első tesztesetet
    % fogja lefuttatni
    elseif(choose == 1)
        diffMachineDiffTicket();
        disp(' ');
    % 2-es teszteset
    elseif(choose == 2)
        sameMachineWithMoreTickets();
        disp(' ');
    % 3-as teszteset
    elseif(choose == 3)
        diffMachineDiffTicketPrice();
        disp(' ');
    % 4-es teszteset
    elseif(choose == 4)
        sameMachineWithMoreTicketsPrice();
    % Nem megfelelő érték megadása esetén újra meg kell adni egyet
    else
        disp('Ezt a szamot nem adhatja meg! Adjon meg egy uj szamot! ');
    end
end
