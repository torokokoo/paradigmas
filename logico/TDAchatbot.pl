%   _____ ____    _       ____ _           _   _           _   
%  |_   _|  _ \  / \     / ___| |__   __ _| |_| |__   ___ | |_ 
%    | | | | | |/ _ \   | |   | '_ \ / _` | __| '_ \ / _ \| __|
%    | | | |_| / ___ \  | |___| | | | (_| | |_| |_) | (_) | |_ 
%    |_| |____/_/   \_\  \____|_| |_|\__,_|\__|_.__/ \___/ \__|
% 

% ----------------------------------------------------
% Tipo de Dato Abstracto: Chatbot
% ----------------------------------------------------

% Lista de Predicados

% chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, C).
% extractFlowIds([], []).
% extractFlowIds([H|T], R).
% getChatbotId([Id, Name, WelcomeMessage, StartFlowId, Flow], Id).
% getChatbotName([Id, Name, WelcomeMessage, StartFlowId, Flow], Name).
% getChatbotWelcomeMessage([Id, Name, WelcomeMessage, StartFlowId, Flow], WelcomeMessage).
% getChatbotStartFlowId([Id, Name, WelcomeMessage, StartFlowId, Flow], StartFlowId).
% getChatbotFlow([Id, Name, WelcomeMessage, StartFlowId, Flow], Flow).

% Metas

% Primarias:
% chatbot 

% Secundarias:
% extractFlowIds, getChatbotId, getChatbotName, getChatbotWelcomeMessage, getChatbotStartFlowId, getChatbotFlow.

% --------------------------- REPRESENTACION ---------------------------

% El TDA se ve representado mediante una lista que contiene un identificador, un nombre, un mensaje de bienvenida
% un id de flujo inicial, y una lista con flujos.

% --------------------------- CONSTRUCTOR ---------------------------

% Descripcion: Constructor de chatbots, crea un chatbot con los datos ingresados y los guarda en C.
% Dominio: Id: integer, Name: string, WelcomeMessage: string, StartFlowId: integer, Flow: list de flows,
% C: chatbot.
chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, C):-
    integer(Id),
    string(Name),
    string(WelcomeMessage),
    integer(StartFlowId),
    is_list(Flow),
    extractFlowIds(Flow, IdsList),
    is_set(IdsList),
    C = [Id, Name, WelcomeMessage, StartFlowId, Flow].

% --------------------------- SELECTORES ---------------------------

% Descripcion: Obtiene el valor Id del chatbot y lo retorna en Id.
% Dominio: []: TDA Chatbot, Id: integer.
getChatbotId([Id, Name, WelcomeMessage, StartFlowId, Flow], Id):-
    chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, _).

% Descripcion: Obtiene el valor Name del chatbot y lo retorna en Name.
% Dominio: []: TDA Chatbot, Name: string.
getChatbotName([Id, Name, WelcomeMessage, StartFlowId, Flow], Name):-
    chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, _).

% Descripcion: Obtiene el valor WelcomeMessage del chatbot y lo retorna en WelcomeMessage.
% Dominio: []: TDA Chatbot, WelcomeMessage: string.
getChatbotWelcomeMessage([Id, Name, WelcomeMessage, StartFlowId, Flow], WelcomeMessage):-
    chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, _).

% Descripcion: Obtiene el valor StartFlowId del chatbot y lo retorna en StartFlowId.
% Dominio: []: TDA Chatbot, StartFlowId: integer.
getChatbotStartFlowId([Id, Name, WelcomeMessage, StartFlowId, Flow], StartFlowId):-
    chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, _).

% Descripcion: Obtiene el valor Flow del chatbot y lo retorna en Flow.
% Dominio: []: TDA Chatbot, Flow: list.
getChatbotFlow([Id, Name, WelcomeMessage, StartFlowId, Flow], Flow):-
    chatbot(Id, Name, WelcomeMessage, StartFlowId, Flow, _).

% --------------------------- OTROS PREDICADOS ---------------------------

% Descripcion: Funcion recursiva que permite extraer uno a uno los Ids de los flujos
% a traves de recursividad, y los agrega a una lista para luego poder ser manipulados.
% Dominio: []: list de flows, R: list con los ids extraidos.

extractFlowIds([], []).
extractFlowIds([H|T], R):-
    getFlowId(H, Id),
    extractFlowIds(T, Ltemp),
    append(Ltemp, [Id], R).