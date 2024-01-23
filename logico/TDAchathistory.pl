%   _____ ____    _       ____ _           _   _   _ _     _                   
%  |_   _|  _ \  / \     / ___| |__   __ _| |_| | | (_)___| |_ ___  _ __ _   _ 
%    | | | | | |/ _ \   | |   | '_ \ / _` | __| |_| | / __| __/ _ \| '__| | | |
%    | | | |_| / ___ \  | |___| | | | (_| | |_|  _  | \__ \ || (_) | |  | |_| |
%    |_| |____/_/   \_\  \____|_| |_|\__,_|\__|_| |_|_|___/\__\___/|_|   \__, |
%                                                                        |___/ 

% ----------------------------------------------------
% Tipo de Dato Abstracto: ChatHistory
% ----------------------------------------------------

% Lista de Predicados

% chatHistory(Name, Chatbot, Message, CH).

% Metas

% Primarias:
% chatHistory 

% Secundarias:
% 

% --------------------------- REPRESENTACION ---------------------------

% El TDA se ve representado mediante una lista que contiene el nombre de quien lo envia, el chatbot que se esta usando,
% el mensaje enviado y una marca temporal de cuando fue utilizado.

% --------------------------- CONSTRUCTOR ---------------------------

% Descripcion: Constructor de ChatHistory, que se ve retornado en CH.
% Dominio: Name: string, Chatbot: chatbot, Message: string, CH: ChatHistory
chatHistory(Name, Chatbot, Message, CH):-
    string(Name),
    is_list(Chatbot),
    string(Message),
    get_time(Time),
    CH = [Name, Chatbot, Message, Time].