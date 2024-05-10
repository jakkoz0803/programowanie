% odwrotna(+L1,L2)
% spe³niony, gdy lista L2 jest odwróceniem listy L1
% --------------------------------------------------

odwrotna(L1,L2):-odwrotna_ak(L1,[],L2).


% odwrotna_ak(+L1,A,L2) - wersja z akumulatorem
% spe³niony, gdy L2 jest po³¹czeniem listy odwrotnej
% do L1 i listy A (akumulatora)
% --------------------------------------------------

% warunek koñcz¹cy rekurencjê: je¿eli L1 jest list¹
% pust¹, wtedy L2=A

odwrotna_ak([],A,A).

% rekurencja:

odwrotna_ak([H|T],A,L2):-
    odwrotna_ak(T,[H|A],L2).
