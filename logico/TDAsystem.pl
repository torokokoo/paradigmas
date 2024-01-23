%   _____ ____    _      ____            _                 
%  |_   _|  _ \  / \    / ___| _   _ ___| |_ ___ _ __ ___  
%    | | | | | |/ _ \   \___ \| | | / __| __/ _ \ '_ ` _ \ 
%    | | | |_| / ___ \   ___) | |_| \__ \ ||  __/ | | | | |
%    |_| |____/_/   \_\ |____/ \__, |___/\__\___|_| |_| |_|
%                              |___/                       

% ----------------------------------------------------
% Tipo de Dato Abstracto: System
% ----------------------------------------------------

% Lista de Predicados

% system(Name, InitialChatbotCodeLink, Chatbots, S).
% getSystemName([Name, _, _, _, _], R).
% getSystemICCL([_, InitialChatbotCodeLink, _, _, _], R).
% getSystemUser([_, _, User, _, _], R).
% getSystemRegisteredUsers([_, _, _, RegisteredUsers, _], R).
% getSystemChatbots([_, _, _, _, Chatbots], R).
% extractChatbotsIds([], []).
% extractChatbotsIds([H|T], R).

% Metas

% Primarias:
% system

% Secundarias:
% getSystemName, getSystemICCL, getSystemUser, getSystemRegisteredUsers, getSystemChatbots, extractChatbotsIds.

% --------------------------- REPRESENTACION ---------------------------

% El TDA se ve representado mediante una lista que contiene el nombre, el ID del chatbot inicial al cual se va a mandar,
% el usuario que se encuentra loggeado, una lista con los usuarios registrados, y una lista de Chabots pertenecientes al sistema.

% --------------------------- CONSTRUCTOR ---------------------------

% Descripcion: Constructor de sistema que se guarda en la variable S.
% Dominio: Name: string, InitialChatbotCodeLink: integer, Chatbots: list de chatbots, S: system
system(Name, InitialChatbotCodeLink, Chatbots, S):-
    string(Name),
    integer(InitialChatbotCodeLink),
    is_list(Chatbots),
    extractChatbotsIds(Chatbots, Ids), % Esta linea
    is_set(Ids), % y esta otra, son para verificar que no se dupliquen los IDS de los chatbots.
    S = [Name, InitialChatbotCodeLink, "", [], Chatbots].

% --------------------------- Selectores ---------------------------

% Descripcion: Obtiene el dato Name del sistema y lo retorna en R.
% Dominio: []: TDA system, R: string
getSystemName([Name, _, _, _, _], R):-
    R = Name.

% Descripcion: Obtiene el dato InitialChatbotCodeLink del sistema y lo retorna en R.
% Dominio: []: TDA system, R: integer
getSystemICCL([_, InitialChatbotCodeLink, _, _, _], R):-
    R = InitialChatbotCodeLink.

% Descripcion: Obtiene el dato User del sistema y lo retorna en R.
% Dominio: []: TDA system, R: string
getSystemUser([_, _, User, _, _], R):-
    R = User.

% Descripcion: Obtiene el dato RegisteredUsers del sistema y lo retorna en R.
% Dominio: []: TDA system, R: list
getSystemRegisteredUsers([_, _, _, RegisteredUsers, _], R):-
    R = RegisteredUsers.

% Descripcion: Obtiene el dato Chatbots del sistema y lo retorna en R.
% Dominio: []: TDA system, R: list
getSystemChatbots([_, _, _, _, Chatbots], R):-
    R = Chatbots.

% --------------------------- Otros predicados ---------------------------

% Descripcion: Funcion recursiva que permite extraer uno a uno los Ids de los chatbots
% a traves de recursividad, y los agrega a una lista para luego poder ser manipulados.
% Dominio: []: list de chatbots, R: list con los ids extraidos.
extractChatbotsIds([], []). % Caso base
extractChatbotsIds([H|T], R):-
    getChatbotId(H, Id),
    extractChatbotsIds(T, Ltemp), % Recursividad
    append(Ltemp, [Id], R).