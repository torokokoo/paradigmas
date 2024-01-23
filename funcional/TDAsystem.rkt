#lang racket

(require "TDAuser.rkt")

;+--------------------------------------------+            
;|                TDA SYSTEM                  |            
;+--------------------------------------------+

;+------------- REPRESENTACION---------------+
; Este TDA corresponde a un systema, donde se guarda un nombre y sus chatbots asignados.

;+------------- CONSTRUCTORES ---------------+

; Dom: name (string), *chatbot (n cantidad de chatbots)
; Rec: system (system)
; Descripcion: Construye un system con el nombre y los chatbots correspondientes.
;              ademas se agrega un string vacio que representa al usuario logeado
;              y una lista vacia con los usuarios registrados en aquel sistema.
; Recursion: No se usa

(define system 
    (lambda (name initialChatbotCodeLink . chatbot)
        (list name initialChatbotCodeLink "" (list ) chatbot)
    )
)

;+------------- PERTENENCIA ---------------+

; Dom: 
; Rec: #t o #f
; Descripcion:
; Recursion: No se usa
; (define (option? option)
;     (and #t #t)
; )

;+------------- SELECTORES ---------------+

;Dom: system (system)
;Rec: name (string)
;Desc: Selecciona el dato name y lo retorna
;Recursion: No se usa
(define (getSystemName system)
    (list-ref system 0)
)

;Dom: system (system)
;Rec: initialChatbotCodeLink (number)
;Desc: Selecciona el dato name y lo retorna
;Recursion: No se usa
(define (getInitialChatbotCodeLink system)
    (list-ref system 1)
)

;Dom: system (system)
;Rec: list (lista de chatbots)
;Desc: Selecciona el dato chatbot y lo retorna
;Recursion: No se usa
(define (getChatbots system)
    (list-ref system 4)
)

;Dom: system (system)
;Rec: string
;Desc: Selecciona el usuario logeado y lo retorna
;Recursion: No se usa
(define (getLoggedInUser system)
    (list-ref system 2)
)

;Dom: system (system)
;Rec: list
;Desc: Selecciona los usuarios registrados y los retorna
;Recursion: No se usa
(define (getRegisteredUsers system)
    (list-ref system 3)
)

;+------------- MODIFICADORES ---------------+


(provide (all-defined-out))
