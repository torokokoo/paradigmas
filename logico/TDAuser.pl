%   _____ ____    _      _   _               
%  |_   _|  _ \  / \    | | | |___  ___ _ __ 
%    | | | | | |/ _ \   | | | / __|/ _ \ '__|
%    | | | |_| / ___ \  | |_| \__ \  __/ |   
%    |_| |____/_/   \_\  \___/|___/\___|_|   

% ----------------------------------------------------
% Tipo de Dato Abstracto: 
% ----------------------------------------------------

% Lista de Predicados

% user(Name, U).
% getUserName([Name, _], R).
% extractUserIds([], []).
% extractUserIds([H|T], R).

% Metas

% Primarias:
% user

% Secundarias:
% getUserName, extractUserIds.

% --------------------------- REPRESENTACION ---------------------------

% El TDA se ve representado mediante una lista que contiene el nombre, y una lista de chatHistories.

% --------------------------- CONSTRUCTOR ---------------------------

% Descripcion: Constructor de sistema que se guarda en la variable U.
% Dominio: Name: string, U: user
user(Name, U):-
    string(Name),
    U = [Name, []].                                   

% --------------------------- SELECTORES ---------------------------

% Descripcion: Obtiene el dato Name de un usuario y lo retorna en R.
% Dominio: []: TDA User, R: string
getUserName([Name, _], R):-
    R = Name.

% Descripcion: Obtiene el dato ChatHistory de un usuario y lo retorna en R.
% Dominio: []: TDA User, R: list.
 getUserChatHistory([_, ChatHistory], R):-
    R = ChatHistory.

% --------------------------- Otros predicados ---------------------------

% Descripcion: Funcion recursiva que permite extraer uno a uno los Ids de los usuarios.
% a traves de recursividad, y los agrega a una lista para luego poder ser manipulados.
% Dominio: []: list de usuarios, R: list con los ids extraidos.
extractUserIds([], []). % Caso base
extractUserIds([H|T], R):-
    getUserName(H, Id),
    extractUserIds(T, Ltemp), % Recursividad
    append(Ltemp, [Id], R).