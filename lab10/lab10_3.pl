% konkat(L1,L2,L3)
% spe³niony, gdy L3 jest po³¹czeniem list L1 i L2
% ------------------------------------------------

% rekurencja ze wzglêdu na listê L1:

% warunek koñcz¹cy rekurencjê: po³¹czenie listy
% pustej z list¹ L daje listê L

konkat([],L,L).

% rekurencja:
% g³owa listy L3 jest g³ow¹ listy L1
% ogon listy L3 jest po³¹czeniem ogona listy L1
% z list¹ L2

konkat([H1|T1],L2,[H1|T3]):-
    konkat(T1,L2,T3).
