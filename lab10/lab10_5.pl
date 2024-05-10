% element(E,L)
% spe³niony, gdy E jest elementem listy L
% --------------------------------------------------------------------

% warunek koñcz¹cy rekurencjê: g³owa listy jest elementem listy

element(E,[E|_]).

% rekurencja: je¿eli E jest elementem listy L, a nie jest jej g³ow¹,
% to jest elementem ogona

element(E,[_|T]):-element(E,T).
