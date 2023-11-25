
% Персонажи из вселенной Леди Баг
character(ladybug).
character(cat_noir).
character(hawkmoth).
character(plagg).
character(marinette).
character(adrien).
character(alya).
character(nino).
character(kagami).
character(gabrielle).
character(maura).
character(natalie).
character(lady_wifi).
character(rena_rouge).
character(trixx).
character(sass).
character(kaalki).
character(carapace).
character(wayzz).
character(foo).


kwami(tikki).

% Суперсила персонажей
superpower(ladybug, lucky_charm).
superpower(cat_noir, cataclysm).
superpower(hawkmoth, akumatization).
superpower(plagg, kwami_transformation).
superpower(tikki, kwami_transformation).
superpower(adrien, none).


% Злодеи 
villain(maura, hawkmoth).
villain(hawkmoth, maura).
villain(hawkmoth, felix).
villain(felix, hawkmoth).
villain(hawkmoth, chloe).
villain(chloe, hawkmoth).

% Друзья  
friend(ladybug, cat_noir).
friend(cat_noir, ladybug).
friend(ladybug, rena_rouge).
friend(rena_rouge, ladybug).
friend(marinette, alya).
friend(adrien, nino).
friend(nino, adrien).
friend(ladybug, tikki).
friend(nino, alya).
friend(marinette, nino).
friend(marinette, adrien).
friend(tikki, plagg).



% Место рождения каждого персонажа
origin(ladybug, paris).
origin(cat_noir, paris).
origin(hawkmoth, paris).
origin(plagg, kwami_world).
origin(tikki, kwami_world).
origin(marinette, paris).
origin(adrien, paris).
origin(felix, paris).
origin(noir, paris).
origin(kagami, japan).
origin(lila, italy).
origin(chloe, paris).



% Уровень опасности злодея
villain_danger_level(hawkmoth, 8).
villain_danger_level(lila, 6).
villain_danger_level(chloe, 4).
villain_danger_level(maura, 7).




% Союзы злодеев и героев, дружат ли между собой персонажи и исходя из того, злодей это или герой, создается союз
alliance(X, Y) :- (friend(X, Y), friend(Y, X)); (villain(X, Y), villain(Y, X)).
% Правило, которое отвечает за нахождение всех друзей
friend_of_friend(X, Y) :- (friend(X, Z), friend(Z, Y)), X \= Y.
% Правило, которое находит людей которые с одного города
same_sity(X, Y) :- origin(X, Z), origin(Y, Z), X \= Y.

% Правило: Обьединение: И друзья и с одного города
friends_in_same_city(X, Y) :- same_sity(X, Y), friend(X, Y).

%  Злодей с более высоким уровнем опасности представляет большую угрозу
greater_villain_threat(X, Y) :- villain_danger_level(X, DX), villain_danger_level(Y, DY), DX > DY.

% Злодей, у которого нет определенной суперсилы
villain_without_superpower(X) :- villain(X, _), not(superpower(X, _)).






% запросы
% character(ladybug).   true 
% superpower(X, Y).      6 связей
% friend(ladybug, X).     X = cat_noir ; X = rena_rouge.


% alliance(ladybug, X).      кот нуар и рена  findall(X, alliance(ladybug, X), Allies).

% friend_of_friend(marinette, X).         Этот запрос вернет всех друзей друзей Маринетт.
% same_sity(plagg, tikki).       true
% friends_in_same_city(tikki, plagg).   true   
% greater_villain_threat(hawkmoth, lila).      true.
% villain_without_superpower(maura).        true.    
% character(X), superpower(X, lucky_charm), origin(X, paris).    ladybug


