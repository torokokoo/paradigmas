#lang racket

;+--------------------------------------------+            
;|                 TDA USER                   |            
;+--------------------------------------------+

;+------------- REPRESENTACION---------------+
; Este TDA corresponde a un usuario, donde se guarda un nombre y sus historiales asignados.

;+------------- CONSTRUCTORES ---------------+

; Dom: name (string)
; Rec: user
; Descripcion: Construye un usuario con el nombre y la lista de historial.
; Recursion: No se usa

(define user 
    (lambda (name)
        (list name (list ))
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

;Dom: user (user)
;Rec: string (string)
;Desc: Selecciona el dato username y lo retorna
;Recursion: No se usa
(define (getUsername user)
    (list-ref system 0)
)

;Dom: user (user)
;Rec: chatHistory (chatHistory)
;Desc: Selecciona el la lista de ChatHistory y lo retorna
;Recursion: No se usa
(define (getChatHistory user)
    (list-ref user 1)
)

;+------------- MODIFICADORES ---------------+

(provide (all-defined-out))