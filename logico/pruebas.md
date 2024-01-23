# Listado de pruebas

Este script debe de correrse a traves de copiar y pegar en la consola luego de correr el archivo con
`swipl main.pl`

*Hay predicados que no han sido implementados, como system-talk-rec, system-synthesis y system-simulate.*

## Pruebas realizadas por el profesor
```prolog
option(1, "1) Viajar", 2, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10),
% systemTalkRec(S10, "hola", S11), % si se descomenta, daría false por que “hola” no es un option o keyword

% NOTA DEL ALMUNO:
% A partir de aqui, el programa va a lanzar un error debido a que no existen los predicados descritos debajo de este mensaje. se recomienda encarecidamente dejarlo comentado.
%systemTalkRec(S10, "1", S12),
%systemTalkRec(S12, "1", S13),
%systemTalkRec(S13, "Museo", S14),
%systemTalkRec(S14, "1", S15),
%systemTalkRec(S15, "3", S16),
%systemTalkRec(S16, "5", S17),
%systemSynthesis(S17, "user2", Str1),
%systemSimulate(S3, 5, 32131, S99).

```

## Pruebas realizadas por el alumno

```prolog
% Crea tres opciones
option(1, "1) Opcion 1", 1, 1, ["manzana", "peras", "sandias"], O1),
option(2, "2) Opcion 2", 2, 1, ["naranja", "tomate", "palta"], O2),
option(3, "3) Opcion 3", 3, 1, ["uva", "platano"], O3),
% Crea tres flujos
flow(1, "Flujo 1", [O1], F1),
flow(2, "Flujo 2", [], F2),
flow(3, "Flujo 3", [O1, O2], F3),
%flow(1, "Flujo Erroneo", [O1, O1], F4) % Arroja error debido a que hay dos option con el mismo ID.
flowAddOption(F3, O3, F4),
% Crea chatbots
chatbot(1, "Chatbot 1", "Mensaje de bievenida", 1, [], C1),
chatbot(2, "Chatbot 2", "Mensaje de bienvenida", 1, [F2, F3], C2),
chatbotAddFlow(C2, F1, C3),
% chatbotAddFlow(C3, F1, C4), % Arroja error.
% Crea sistemas
system("Sistema 1", 1, [], S1),
system("Sistema 2", 2, [C1], S2),
systemAddChatbot(S2, C2, S3),
% Agrega usuarios
systemAddUser(S3, "user1", S4),
systemAddUser(S4, "user2", S5),
systemAddUser(S5, "user3", S6),
% systemAddUser(S6, "user1", S7), % Lanza error debido a que ya existe
% Login y logout
systemLogin(S6, "user1", S7),
systemLogout(S7, S8),
systemLogin(S8, "user2", S9).
% No se crean ejemplos del resto de predicados debido a que no se encuentran implementados.


```
