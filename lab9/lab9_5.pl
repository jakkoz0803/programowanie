% liczba_elem1(+L,?N) - wersja naiwna
% spe³niony, gdy N jest liczb¹ elementów listy L
% --------------------------------------------------

% warunek koñcz¹cy rekurencjê: lista pusta ma
% zero elementów

liczba_elem1([],0).

% rekurencja: liczba elementów listy L jest równa
% d³ugoœci ogona tej listy plus 1

liczba_elem1([_|T],N):-
    liczba_elem1(T,N1),
    N is N1+1.

