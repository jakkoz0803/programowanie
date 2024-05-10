% kwadrat_listy(+L1,?L2).
% spe³niony, gdy elementy listy L2 s¹ kwadratami
% elementów listy L1; lista L1 jest list¹ liczbow¹
% ograniczenia:  L1 i L2 s¹ listami liczbowymi.
% -------------------------------------------------

% warunek koñcz¹cy rekurencjê: kwadrat listy pustej
% jest list¹ pust¹.

kwadrat_listy([],[]).

% rekurencja:

kwadrat_listy([H1|T1],[H2|T2]):-
    H2 is H1*H1,
    kwadrat_listy(T1,T2).

