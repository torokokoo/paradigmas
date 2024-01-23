/*
  _____ ____    _       ___        _   _             
 |_   _|  _ \  / \     / _ \ _ __ | |_(_) ___  _ __  
   | | | | | |/ _ \   | | | | '_ \| __| |/ _ \| '_ \ 
   | | | |_| / ___ \  | |_| | |_) | |_| | (_) | | | |
   |_| |____/_/   \_\  \___/| .__/ \__|_|\___/|_| |_|
                            |_|                         */

% ----------------------------------------------------
% Tipo de Dato Abstracto: Option
% ----------------------------------------------------

% Lista de Predicados

% option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, O).
% getOptionId([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], Code).
% getOptionMessage([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], Message).
% getOptionChatbotCodeLink([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], ChatbotCodeLink).
% getOptionInitialFlowCodeLink([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], InitialFlowCodeLink).
% getOptionKeyword([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], Keyword).

% Metas

% Primarias:
% option

% Secundarias:
% getOptionId, getOptionMessage, getOptionChatbotCodeLink, getOptionInitialFlowCodeLink, getOptionKeyword.

% --------------------------- REPRESENTACION ---------------------------

% El TDA se ve representado mediante una lista que contiene el codigo, el mensaje, una referencia al
% chatbot que se mandara, una referencia al ID del flujo que se mandara y una lista de palabras claves.


% --------------------------- CONSTRUCTOR ---------------------------

% Descripcion: Constructor de opciones, crea una opcion y lo guarda en O.
% Dominio: code: Integer, message: String, chatbotCodeLink: Integer,
% initialFlowCodeLink: Integer, keyword: Lista de Strings, O: list.
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, O):-
    integer(Code),
    string(Message),
    integer(ChatbotCodeLink),
    integer(InitialFlowCodeLink),
    is_list(Keyword),
    O = [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword].

% --------------------------- SELECTORES ---------------------------

% Descripcion: Obtiene el dato Code de una Option y lo retorna en Code.
% Dominio: [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]: TDA Option, Code: integer. 
getOptionId([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], Code):-
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, _).

% Descripcion: Obtiene el dato Message de una Option y lo retorna en Message.
% Dominio: [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]: TDA Option, Message: string. 
getOptionMessage([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], Message):-
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, _).

% Descripcion: Obtiene el dato ChatbotCodeLink de una Option y lo retorna en ChatbotCodeLink.
% Dominio: [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]: TDA Option, ChatbotCodeLink: Integer. 
getOptionChatbotCodeLink([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], ChatbotCodeLink):-
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, _).

% Descripcion: Obtiene el dato InitialFlowCodeLink de una Option y lo retorna en InitialFlowCodeLink.
% Dominio: [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]: TDA Option, InitialFlowCodeLink: Integer. 
getOptionInitialFlowCodeLink([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], InitialFlowCodeLink):-
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, _).

% Descripcion: Obtiene el dato Keyword de una Option y lo retorna en Keyword.
% Dominio: [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]: TDA Option, Keyword: List. 
getOptionKeyword([Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword], Keyword):-
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, _).