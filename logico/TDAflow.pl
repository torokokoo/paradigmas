/*
  _____ ____    _      _____ _               
 |_   _|  _ \  / \    |  ___| | _____      __
   | | | | | |/ _ \   | |_  | |/ _ \ \ /\ / /
   | | | |_| / ___ \  |  _| | | (_) \ V  V / 
   |_| |____/_/   \_\ |_|   |_|\___/ \_/\_/  
                                             */

% ----------------------------------------------------
% Tipo de Dato Abstracto: Flow
% ----------------------------------------------------

% Lista de Predicados

% flow(Id, NameMsg, Option, F).
% extractIds([], []).
% extractIds([H|T], R).
% getFlowOptions([Id, NameMsg, Option], Option).
% getFlowId([Id, NameMsg, Option], Id).
% getFlowNameMsg([Id, NameMsg, Option], NameMsg).

% Metas

% Primarias:
% flow

% Secundarias:
% extractIds, getFlowOptions, getFlowId, getFlowNameMsg

% --------------------------- REPRESENTACION ---------------------------

% El TDA se ve representado mediante una lista que contiene el Id del flujo, el mensaje que se
% arrojara y una lista de opciones

% --------------------------- CONSTRUCTOR ---------------------------

% Descripcion: Constructor de flujos, crea un flujo y lo guarda en F.
% Dominio: Id: integer, NameMsg: string, Option: list de options, F: list.
flow(Id, NameMsg, Option, F):-
    integer(Id),
    string(NameMsg),
    is_list(Option),
    extractIds(Option, IdsList),
    is_set(IdsList),
    F = [Id, NameMsg, Option].

% --------------------------- Selectores ---------------------------

% Descripcion: Obtiene el dato Option desde el flujo y lo retorna en Option.
% Dominio: [Id, NameMsg, Option]: TDA flow, Option: list 
getFlowOptions([Id, NameMsg, Option], Option):-
    flow(Id, NameMsg, Option, _).

% Descripcion: Obtiene el dato Id desde el flujo y lo retorna en Id.
% Dominio: [Id, NameMsg, Option]: TDA flow, Id: integer. 
getFlowId([Id, NameMsg, Option], Id):-
    flow(Id, NameMsg, Option, _).

% Descripcion: Obtiene el dato NameMsg desde el flujo y lo retorna en NameMsg.
% Dominio: [Id, NameMsg, Option]: TDA flow, NameMsg: string. 
getFlowNameMsg([Id, NameMsg, Option], NameMsg):-
    flow(Id, NameMsg, Option, _).

% --------------------------- Otros predicados ---------------------------

% Descripcion: Funcion recursiva que permite extraer uno a uno los Ids de los flujos
% a traves de recursividad, y los agrega a una lista para luego poder ser manipulados.
% Dominio: []: list de flows, R: list con los ids extraidos.
extractIds([], []). % Caso base.
extractIds([H|T], R):-
    getOptionId(H, Code),
    extractIds(T, Ltemp), % Recursividad
    append(Ltemp, [Code], R).
