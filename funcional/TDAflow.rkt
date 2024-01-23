#lang racket

(require "TDAoption.rkt")

;+--------------------------------------------+            
;|                TDA FLOW                  |            
;+--------------------------------------------+

;+------------- REPRESENTACION---------------+
; Este TDA corresponde a un flow, donde se guarda el flujo y sus opciones

;+------------- CONSTRUCTORES ---------------+

; Dom: name (string?), name-msg (string), *option (n cantidad de option?)
; Rec: flow (flow?)
; Descripcion: Crea un flujo con el nombre, mensaje y las opciones ingresadas
; Recursion: No se usa

(define flow 
    (lambda (id name-msg . option)
        (list id name-msg (remove-duplicates option))
    )
)

;+------------- PERTENENCIA ---------------+

; Dom: flow (flow?)
; Rec: #t o #f
; Descripcion: Revisa si se pertenece a un flow
; Recursion: No se usa
(define (flow? flow)
    (and (number? (list-ref flow 0)) (string? (list-ref flow 1)) (option? (car (list-ref flow 2))))
)

;+------------- SELECTORES ---------------+

;Dom: flow (flow?)
;Rec: id (number)
;Desc: Selecciona el dato id y lo retorna
;Recursion: No se usa
(define (getFlowId flow)
    (list-ref flow 0)
)

;Dom: flow (flow?)
;Rec: name (string)
;Desc: Selecciona el dato name y lo retorna
;Recursion: No se usa
(define (getNameMsg flow)
    (list-ref flow 1)
)

;Dom: flow (flow?)
;Rec: list (lista de options?)
;Desc: Selecciona el dato options y lo retorna
;Recursion: No se usa
(define (getOptions flow)
    (list-ref flow 2)
)


(provide (all-defined-out))
