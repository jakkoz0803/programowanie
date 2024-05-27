% Fakty i reguly dotyczace akwarystyki
:- dynamic ryba/2.
:- dynamic roslina/2.
:- dynamic fish/3.
:- dynamic aquarium/3.
:- discontiguous ryba/2.
:- discontiguous roslina/2.

% Definicja akwarystyki
akwarystyka(slko) :- slodkowodna(slko).
akwarystyka(mar) :- morska(mar).

% Przyklady slodkowodnych akwariów
slodkowodna(akwarium1).
slodkowodna(akwarium2).

% Przyklady morskich akwariów
morska(akwarium3).
morska(akwarium4).

% Rodzaje organizmów hodowanych w akwariach slodkowodnych
ryba(gupik, slodkowodna).
ryba(skalar, slodkowodna).
ryba(neon, slodkowodna).
roslina(kryptokoryna, slodkowodna).
roslina(anubias, slodkowodna).

% Rodzaje organizmów hodowanych w akwariach morskich
ryba(bodlok, morska).
ryba(mandaryn, morska).
ryba(blekitek, morska).
roslina(halimeda, morska).
roslina(makroglon, morska).

% Reguly okreslajace czy dany organizm jest odpowiedni do konkretnego akwarium
odpowiedni_do(Organizm, Akwarium) :-
    slodkowodna(Akwarium),
    (ryba(Organizm, slodkowodna); roslina(Organizm, slodkowodna)).

odpowiedni_do(Organizm, Akwarium) :-
    morska(Akwarium),
    (ryba(Organizm, morska); roslina(Organizm, morska)).

% Informacje o parametrach wody dla akwariów slodkowodnych
parametry_wody(slko, ph(6, 7.5)).
parametry_wody(slko, temperatura(22, 28)).
parametry_wody(slko, twardosc(4, 12)).

% Informacje o parametrach wody dla akwariów morskich
parametry_wody(mar, ph(8.1, 8.4)).
parametry_wody(mar, temperatura(24, 26)).
parametry_wody(mar, twardosc(8, 12)).

% Reguly okreslajace optymalne parametry wody dla danego akwarium
optymalne_parametry(Akwarium, ph, (Min, Max)) :-
    slodkowodna(Akwarium),
    parametry_wody(slko, ph(Min, Max)).

optymalne_parametry(Akwarium, temperatura, (Min, Max)) :-
    slodkowodna(Akwarium),
    parametry_wody(slko, temperatura(Min, Max)).

optymalne_parametry(Akwarium, twardosc, (Min, Max)) :-
    slodkowodna(Akwarium),
    parametry_wody(slko, twardosc(Min, Max)).

optymalne_parametry(Akwarium, ph, (Min, Max)) :-
    morska(Akwarium),
    parametry_wody(mar, ph(Min, Max)).

optymalne_parametry(Akwarium, temperatura, (Min, Max)) :-
    morska(Akwarium),
    parametry_wody(mar, temperatura(Min, Max)).

optymalne_parametry(Akwarium, twardosc, (Min, Max)) :-
    morska(Akwarium),
    parametry_wody(mar, twardosc(Min, Max)).

% Informacje o pokarmie dla ryb slodkowodnych
pokarm(dafnia, gupik).
pokarm(dafnia, skalar).
pokarm(dafnia, neon).
pokarm(plankton, skalar).
pokarm(larwy_komara, neon).

% Informacje o pokarmie dla ryb morskich
pokarm(artemia, bodlok).
pokarm(artemia, mandaryn).
pokarm(krewetki, blekitek).
pokarm(plankton, mandaryn).
pokarm(glony, bodlok).

% Reguly okreslajace, czy dany pokarm jest odpowiedni dla konkretnej ryby
odpowiedni_pokarm(Ryba, Pokarm) :-
    ryba(Ryba, _),
    pokarm(Pokarm, Ryba).

% Informacje o rozmiarze akwariów dla róznych gatunków
minimalny_rozmiar(akwarium1, 50).
minimalny_rozmiar(akwarium2, 100).
minimalny_rozmiar(akwarium3, 200).
minimalny_rozmiar(akwarium4, 300).

% Informacje o wymaganiach rozmiarowych dla róznych gatunków
wymagany_rozmiar(gupik, 20).
wymagany_rozmiar(skalar, 50).
wymagany_rozmiar(neon, 10).
wymagany_rozmiar(bodlok, 100).
wymagany_rozmiar(mandaryn, 75).
wymagany_rozmiar(blekitek, 50).

% Reguly okreslajace, czy dany gatunek moze byc hodowany w danym akwarium
moze_byc_hodowany(Gatunek, Akwarium) :-
    minimalny_rozmiar(Akwarium, RozmiarAkwarium),
    wymagany_rozmiar(Gatunek, WymaganyRozmiar),
    RozmiarAkwarium >= WymaganyRozmiar.

% Przyklady dodatkowych regul dotyczacych pielegnacji akwariów
koniecznosc_filtracji(akwarium1).
koniecznosc_filtracji(akwarium2).
koniecznosc_filtracji(akwarium3).
koniecznosc_filtracji(akwarium4).

koniecznosc_podmiany_wody(akwarium1, tygodniowo).
koniecznosc_podmiany_wody(akwarium2, tygodniowo).
koniecznosc_podmiany_wody(akwarium3, co_dwa_tygodnie).
koniecznosc_podmiany_wody(akwarium4, co_dwa_tygodnie).

% Menu glówne
main_menu :-
    write('--- Menu Akwarystyki ---'), nl,
    write('1. Dodaj akwarium'), nl,
    write('2. Dodaj rybe do akwarium'), nl,
    write('3. Sprawdz odpowiednosc organizmu do akwarium'), nl,
    write('4. Sprawdz optymalne parametry wody dla akwarium'), nl,
    write('5. Sprawdz odpowiedni pokarm dla ryby'), nl,
    write('6. Sprawdz czy ryba moze byc hodowana w akwarium'), nl,
    write('7. Wyswietl informacje o akwariach'), nl,
    write('8. Wyswietl wszystkie ryby'), nl,
    write('9. Wyswietl wszystkie pokarmy'), nl,
    write('10. Wyjscie'), nl,
    write('Wybierz opcje (1-10): '),
    read(Choice),
    handle_choice(Choice).

% Obsluga wyboru uzytkownika
handle_choice(1) :- add_aquarium, main_menu.
handle_choice(2) :- add_fish, main_menu.
handle_choice(3) :- check_organism_suitability, main_menu.
handle_choice(4) :- check_optimal_parameters, main_menu.
handle_choice(5) :- check_food_suitability, main_menu.
handle_choice(6) :- check_fish_housing, main_menu.
handle_choice(7) :- display_aquariums, main_menu.
handle_choice(8) :- display_all_fish, main_menu.
handle_choice(9) :- display_all_foods, main_menu.
handle_choice(10) :- write('Do widzenia!'), nl.
handle_choice(_) :- write('Nieprawidlowy wybór, spróbuj ponownie.'), nl, main_menu.

% Dodawanie akwarium
add_aquarium :-
    write('Podaj nazwe akwarium: '),
    read(Name),
    write('Podaj pojemnosc akwarium (w litrach): '),
    read(Capacity),
    write('Podaj typ akwarium (slodkowodne/morskie): '),
    read(Type),
    (member(Type, [slodkowodne, morskie]) ->
        (\+ aquarium(Name, _, _) ->
            assertz(aquarium(Name, Capacity, Type)),
            write('Akwarium dodane.'), nl;
            write('Akwarium o tej nazwie juz istnieje.'), nl);
        write('Nieprawidlowy typ akwarium. Mozliwe typy to: slodkowodne, morskie.'), nl).

% Dodawanie ryby
add_fish :-
    write('Podaj nazwe akwarium: '),
    read(AquariumName),
    (aquarium(AquariumName, _, Type) ->
        write('Podaj nazwe ryby: '),
        read(FishName),
        (ryba(FishName, FishType),
         ((Type = slodkowodne, FishType = slodkowodna);
          (Type = morskie, FishType = morska)) ->
            assertz(fish(FishName, FishType, AquariumName)),
            write('Ryba dodana do akwarium.'), nl;
            write('Ryba nie jest odpowiednia do typu akwarium.'), nl);
        write('Akwarium nie istnieje.'), nl).

% Sprawdzanie odpowiednosci organizmu do akwarium
check_organism_suitability :-
    write('Podaj nazwe organizmu: '),
    read(Organism),
    write('Podaj nazwe akwarium: '),
    read(Aquarium),
    (odpowiedni_do(Organism, Aquarium) ->
        write('Organizm '), write(Organism), write(' jest odpowiedni do akwarium '), write(Aquarium), nl;
        write('Organizm '), write(Organism), write(' nie jest odpowiedni do akwarium '), write(Aquarium), nl).

% Sprawdzanie optymalnych parametrów wody dla akwarium
check_optimal_parameters :-
    write('Podaj nazwe akwarium: '),
    read(Aquarium),
    write('Podaj parametr (ph/temperatura/twardosc): '),
    read(Parametr),
    (member(Parametr, [ph, temperatura, twardosc]) ->
        (optymalne_parametry(Akwarium, Parametr, (Min, Max)) ->
            write('Optymalne parametry '), write(Parametr), write(' dla akwarium '), write(Aquarium), write(' to: '), write(Min), write(' - '), write(Max), nl;
            write('Nie znaleziono optymalnych parametrów dla podanego akwarium i parametru.'), nl);
        write('Niepoprawny parametr.'), nl).

% Sprawdzanie odpowiedniego pokarmu dla ryby
check_food_suitability :-
    write('Podaj nazwe ryby: '),
    read(Ryba),
    write('Podaj nazwe pokarmu: '),
    read(Pokarm),
    (odpowiedni_pokarm(Ryba, Pokarm) ->
        write('Pokarm '), write(Pokarm), write(' jest odpowiedni dla ryby '), write(Ryba), nl;
        write('Pokarm '), write(Pokarm), write(' nie jest odpowiedni dla ryby '), write(Ryba), nl).

% Sprawdzanie czy ryba moze byc hodowana w akwarium
check_fish_housing :-
    write('Podaj nazwe ryby: '),
    read(Ryba),
    write('Podaj nazwe akwarium: '),
    read(Aquarium),
    (moze_byc_hodowany(Ryba, Aquarium) ->
        write('Ryba '), write(Ryba), write(' moze byc hodowana w akwarium '), write(Aquarium), nl;
        write('Ryba '), write(Ryba), write(' nie moze byc hodowana w akwarium '), write(Aquarium), nl).

% Wyswietlanie informacji o akwariach
display_aquariums :-
    write('--- Lista akwariów ---'), nl,
    forall(aquarium(Name, Capacity, Type),
           (write('Akwarium: '), write(Name), nl,
            write('Pojemnosc: '), write(Capacity), write(' litrów'), nl,
            write('Typ: '), write(Type), nl,
            write('Ryby:'), nl,
            forall(fish(FishName, FishType, Name),
                   (write(' - '), write(FishName), write(' ('), write(FishType), write(')'), nl)),
            nl)),
    write('--- Koniec listy ---'), nl.

% Wyswietlanie wszystkich ryb
display_all_fish :-
    write('--- Lista wszystkich ryb ---'), nl,
    forall(ryba(Name, Type),
           (write('Ryba: '), write(Name), write(' ('), write(Type), write(')'), nl)),
    write('--- Koniec listy ---'), nl.

% Wyswietlanie wszystkich pokarmów
display_all_foods :-
    write('--- Lista wszystkich pokarmów ---'), nl,
    forall(pokarm(Food, Fish),
           (write('Pokarm: '), write(Food), write(' dla ryby: '), write(Fish), nl)),
    write('--- Koniec listy ---'), nl.

% Uruchomienie programu
:- initialization(main_menu).
