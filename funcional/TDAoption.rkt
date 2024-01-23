#lang racket

;+--------------------------------------------+            
;|                TDA OPTION                  |            
;+--------------------------------------------+

;+------------- REPRESENTACION---------------+
; Este TDA corresponde a una Option, donde se guarda el codigo, el mensaje, el codigo del chatbot, del flujo y
; una lista de palabras claves a utilizar 

;+------------- CONSTRUCTORES ---------------+

; Dom: code (int), message (string), chatbotCodeLink (int), initialFlowCodeLink (int), *keyword (*string)
; Rec: option
; Descripcion: Funcion constructora de opciones

(define option 
    (lambda (code message chatbotCodeLink initialFlowCodeLink . keyword)
        (list code message chatbotCodeLink initialFlowCodeLink (remove-duplicates keyword))
    )
)

;+------------- PERTENENCIA ---------------+

; Dom: 
; Rec: #t o #f
; Descripcion:
; Recursion: No se usa
(define (option? option)
    (and 
        (number? (list-ref option 0))
        (string? (list-ref option 1))
        (number? (list-ref option 2))
        (number? (list-ref option 3))
        (andmap string? (list-ref option 4))
    )
)

;+------------- SELECTORES ---------------+

;Dom: option (option)
;Rec: code (number)
;Desc: Selecciona el dato code y lo retorna
;Recursion: No se usa
(define (getCode option)
    (car option)
)

;Dom: option (option)
;Rec: message (string)
;Desc: Selecciona el dato string y lo retorna
;Recursion: No se usa
(define (getMessage option)
    (cadr option)
)

;Dom: option (option)
;Rec: chatbotCodeLink (???)
;Desc: Selecciona el dato chatboteCodeLink y lo retorna
;Recursion: No se usa
(define (getChatbotCodeLink option)
    (caddr option)
)

;Dom: option (option)
;Rec: flowCodeLink (???)
;Desc: Selecciona el dato flowCodeLink y lo retorna
;Recursion: No se usa
(define (getFlowCodeLink option)
    (cadddr option)
)

;Dom: option (option)
;Rec: keywords (list)
;Desc: Selecciona el dato flowCodeLink y lo retorna
;Recursion: No se usa
(define (getKeywords option)
    (list-ref option 4)
)

(provide (all-defined-out))