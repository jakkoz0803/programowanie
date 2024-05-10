% liczba_elem2(+L,?N)
% spe³niony, gdy N jest liczb¹ elementów listy L
% -----------------------

liczba_elem2(L,N):-liczba_elem_ak(L,0,N).


% liczba_elem_ak(+L,+A,?N) - wersja z akumulatorem
% spe³niony, gdy N jest liczb¹ elementów listy L
% plus zawartoœæ akumulatora A
% -----------------------

% warunek koñcz¹cy rekurencjê: dla listy pustej
% N = A

liczba_elem_ak([],A,A).

% rekurencja: N jest równe liczbie elementów ogona
% listy L + zawartoœæ A powiêkszona o 1

liczba_elem_ak([_|T],A,N):-
    A1 is A+1,
    liczba_elem_ak(T,A1,N).
