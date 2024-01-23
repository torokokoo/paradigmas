#lang racket

(require "TDAoption.rkt")
(require "TDAflow.rkt")

;+--------------------------------------------+            
;|                TDA CHATBOT                  |            
;+--------------------------------------------+

;+------------- REPRESENTACION---------------+
; Este TDA corresponde a un chatbot, donde se guarda el flujo y sus opciones

;+------------- CONSTRUCTORES ---------------+

; Dom: chatbotId (int), name (string), welcomeMessage (string), startFlowId (int), flow (n cantidad de flow?)
; Rec: chatbot (chatbot)
; Descripcion: Constructor de chatbot, retorna el id, el nombre, el mensaje de bienvenida, el flujo inicial y n cantidad de flujos asignados.
; Recursion: No se usa

(define chatbot 
    (lambda (chatbotId name welcomeMessage startFlowId . flow)
        (list chatbotId name welcomeMessage startFlowId (remove-duplicates flow))
    )
)

;+------------- PERTENENCIA ---------------+

; Dom: 
; Rec: #t o #f
; Descripcion:
; Recursion: No se usa
; (define (flow? flow)
;     (and (string? (list-ref flow 0)) (option? (car (list-ref flow 1))))
; )

;+------------- SELECTORES ---------------+

;Dom: chatbot (chatbot)
;Rec: id (number)
;Desc: Selecciona el dato id y lo retorna
;Recursion: No se usa
(define (getChatbotId chatbot)
    (list-ref chatbot 0)
)

;Dom: chatbot (chatbot)
;Rec: name (string)
;Desc: Selecciona el dato name y lo retorna
;Recursion: No se usa
(define (getChatbotName chatbot)
    (list-ref chatbot 1)
)

;Dom: chatbot (chatbot)
;Rec: welcomeMessage (string)
;Desc: Selecciona el dato welcomeMessage y lo retorna
;Recursion: No se usa
(define (getWelcomeMessage chatbot)
    (list-ref chatbot 2)
)

;Dom: chatbot (chatbot)
;Rec: startFlowId (number?)
;Desc: Selecciona el dato startFlowId y lo retorna
;Recursion: No se usa
(define (getStartFlowId chatbot)
    (list-ref chatbot 3)
)

;Dom: chatbot (chatbot)
;Rec: flow (lista de flujos)
;Desc: Selecciona el dato flows y lo retorna
;Recursion: No se usa
(define (getFlows chatbot)
    (list-ref chatbot 4)
)

;+------------- MODIFICADORES ---------------+


;Dom: originalFlow (lista de flow), newFlow (flow)
;Rec: list (lista de flujos)
;Desc: Funcion de apoyo para la recursividad, validando la existencia de casos bases.
;Recursion: natural
(define (chatbot-add-flow-recursion originalFlow newFlow)
    (if (not (empty? originalFlow))
        (if (not (null? (cdr originalFlow)))
            (append (list (car originalFlow)) (chatbot-add-flow-recursion (cdr originalFlow)) newFlow)
            (append (list (car originalFlow)) (list newFlow))
        )
        (append (list newFlow))
    )
)

(provide (all-defined-out))
