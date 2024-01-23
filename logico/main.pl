/*
  _          _                     _             _         ___ ___ 
 | |    __ _| |__   ___  _ __ __ _| |_ ___  _ __(_) ___   |_ _|_ _|
 | |   / _` | '_ \ / _ \| '__/ _` | __/ _ \| '__| |/ _ \   | | | | 
 | |__| (_| | |_) | (_) | | | (_| | || (_) | |  | | (_) |  | | | | 
 |_____\__,_|_.__/ \___/|_|  \__,_|\__\___/|_|  |_|\___/  |___|___| */

 % Nombre: Diego Toro Barrenechea
 % Rut: 20.807.369-9
 % Profesor: Edmundo Leiva

% --------------------------- IMPORTACIONES ---------------------------
% Se importan todos los TDA creados para la realizacion de este laboratorio con el predicado include().

:-include("TDAoption.pl").
:-include("TDAflow.pl").
:-include("TDAchatbot.pl").
:-include("TDAsystem.pl").
:-include("TDAuser.pl").
:-include("TDAchathistory.pl").

% --------------------------- REQUERIMIENTOS FUNCIONALES ---------------------------
% A partir de aca se encuentran todos los requerimientos funcionales solicitados y que fueron creados.



% ----------------------------------------------------
%                    FlowAddOption
% ----------------------------------------------------
% Descripcion: Se agrega una opcion a un flujo ya creado y se retorna un nuevo flujo con la opcion ya incluida,
% solamente si la opcion tiene un ID distinto a los IDs de las opciones ya ingresadas en el flujo.
% Dominio: Finicial: flow, O: option, Fresultado: flow.
flowAddOption(Finicial, O, Fresultado):-
    getFlowOptions(Finicial, Oinicial),
    getFlowId(Finicial, IdInicial),
    getFlowNameMsg(Finicial, NameMsgInicial),
    extractIds(Oinicial, Ltemp),
    getOptionId(O, Oid),
    not(member(Oid, Ltemp)),
    append([O], Oinicial, Ofinal),
    flow(IdInicial, NameMsgInicial, Ofinal, Fresultado).


% ----------------------------------------------------
%                    chatbotAddFlow
% ----------------------------------------------------
% Descripcion: Se agrega un flujo a un chatbot ya creado y se retorna un nuevo chatbot con el flujo ya incluido,
% solamente si el flujo tiene un ID distinto a los IDs de los flujos ya ingresados en el chatbot.
% Dominio: Cinicial: chatbot, F: flow, Cfinal: chatbot.
chatbotAddFlow(Cinicial, F, Cfinal):-
    getChatbotId(Cinicial, IdInicial),
    getChatbotName(Cinicial, NameInicial),
    getChatbotWelcomeMessage(Cinicial, WMinicial),
    getChatbotStartFlowId(Cinicial, SFIDinicial),
    getChatbotFlow(Cinicial, FlowInicial),
    extractFlowIds(FlowInicial, Ltemp),
    getFlowId(F, Fid),
    not(member(Fid, Ltemp)),
    append([F], FlowInicial, FlowFinal),
    chatbot(IdInicial, NameInicial, WMinicial, SFIDinicial, FlowFinal, Cfinal).

% ----------------------------------------------------
%                    systemAddChatbot
% ----------------------------------------------------
% Descripcion: Se agrega un chatbot a un system ya creado y se retorna un nuevo system con el chatbot ya incluido,
% solamente si el chatbot tiene un ID distinto a los IDs de los chatbot ya ingresados en el system.
% Dominio: Sinicial: system, C: chatbot, Sfinal: system.
systemAddChatbot(Sinicial, C, Sfinal):-
    getSystemName(Sinicial, Name),
    getSystemICCL(Sinicial, InitialChatbotCodeLink),
    getSystemChatbots(Sinicial, Chatbots),
    getSystemUser(Sinicial, User),
    getSystemRegisteredUsers(Sinicial, RegisteredUsers),
    extractChatbotsIds(Chatbots, Ltemp),
    getChatbotId(C, Cid),
    not(member(Cid, Ltemp)),
    append(Chatbots, [C], ChatbotsFinal),
    Sfinal = [Name, InitialChatbotCodeLink, User, RegisteredUsers, ChatbotsFinal].

% ----------------------------------------------------
%                    systemAddUser
% ----------------------------------------------------
% Descripcion: Se agrega un usuario nuevo al sistema, para esto es necesario revisar si ya existe un usuario con el mismo
% nombre en el sistema, si no es el caso, se crea un TDA User que se agrega al sistema para que tenga un chatHistory correspondiente.
% Dominio: Sinicial: system, User: string, Sfinal: system.
systemAddUser(Sinicial, User, Sfinal):-
    getSystemName(Sinicial, Name),
    getSystemICCL(Sinicial, InitialChatbotCodeLink),
    getSystemChatbots(Sinicial, Chatbots),
    getSystemUser(Sinicial, UserInicial),
    getSystemRegisteredUsers(Sinicial, RegisteredUsers),
    extractUserIds(RegisteredUsers, Ltemp),
    not(member(User, Ltemp)),
    user(User, U),
    append(RegisteredUsers, [U], RegisteredUsersFinal),
    Sfinal = [Name, InitialChatbotCodeLink, UserInicial, RegisteredUsersFinal, Chatbots].

% ----------------------------------------------------
%                    systemLogin
% ----------------------------------------------------
% Descripcion: Se inicia sesion en el sistema, para esto se valida si el usuario esta en la lista en los usuarios registrados,
% y ademas se revisa que no haya un usuario que ya se encuentre loggeado en el sistema.
% Dominio: Sinicial: system, User: string, Sfinal: system.
systemLogin(Sinicial, User, Sfinal):-
    getSystemName(Sinicial, Name),
    getSystemICCL(Sinicial, InitialChatbotCodeLink),
    getSystemChatbots(Sinicial, Chatbots),
    getSystemUser(Sinicial, UserInicial),
    getSystemRegisteredUsers(Sinicial, RegisteredUsers),
    extractUserIds(RegisteredUsers, Ltemp),
    member(User, Ltemp),
    UserInicial == "",
    Sfinal = [Name, InitialChatbotCodeLink, User, RegisteredUsers, Chatbots].

% ----------------------------------------------------
%                    systemLogout
% ----------------------------------------------------
% Descripcion: Se cierra sesion en el sistema, retornando el valor User de TDA system a su defecto ("").
% Dominio: Sinicial: system, Sfinal: system.
systemLogout(Sinicial, Sfinal):-
    getSystemName(Sinicial, Name),
    getSystemICCL(Sinicial, InitialChatbotCodeLink),
    getSystemChatbots(Sinicial, Chatbots),
    getSystemRegisteredUsers(Sinicial, RegisteredUsers),
    Sfinal = [Name, InitialChatbotCodeLink, "", RegisteredUsers, Chatbots].

