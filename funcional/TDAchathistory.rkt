#lang racket

;+--------------------------------------------+            
;|              TDA CHATHISTORY               |            
;+--------------------------------------------+

;+------------- REPRESENTACION---------------+
; Este TDA corresponde a un chathistory, donde se guarda un nombre y el chatbot asignado, el mensaje
; y el tiempo en el que fue enviado

;+------------- CONSTRUCTORES ---------------+

; Dom: name (string), chatbot (chatbot), msg (string)
; Rec: chatHistory
; Descripcion: Construye un historial con el nombre, el chatbot, el mensaje y la hora 

(define chatHistory 
    (lambda (name chatbot msg)
        (list name chatbot msg (seconds->date (current-seconds )))
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

;Dom: chatHistory (chatHistory)
;Rec: user (string)
;Desc: Selecciona el dato user y lo retorna
;Recursion: No se usa
(define (getUserChatHistory chatHistory)
    (list-ref chatHistory 0)
)

;Dom: chatHitory (chatHistory)
;Rec: Chatbot (chatbot)
;Desc: Selecciona el dato chatbot y lo retorna
;Recursion: No se usa
(define (getChatbotChatHistory chatHistory)
    (list-ref chatHistory 1)
)

;+------------- MODIFICADORES ---------------+

(provide (all-defined-out))