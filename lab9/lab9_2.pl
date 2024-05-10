% PRZETWARZANIE LIST

% wypisz_lista(L)
% spe³niony, gdy ka¿dy element listy L zostanie
% wypisany w nowym wierszu
% ------------------------------------------------

% warunek koñcz¹cy rekurencjê: listê pust¹ uznajemy
% za wypisan¹

wypisz_lista([]).

% rekurencja: wypisujemy g³owê listy i powtarzamy
% procedurê wypisywania dla ogona listy;
% predykat write/1  wypisuje term H
% predykat nl/0     wyprowadza now¹ liniê

wypisz_lista([H|T]):-
    write(H),
    nl,
    wypisz_lista(T).
