#lang racket

(require "TDAoption.rkt")
(require "TDAuser.rkt")
(require "TDAflow.rkt")
(require "TDAchatbot.rkt")
(require "TDAsystem.rkt")
(require "TDAchathistory.rkt")

;+------------- REQUERIMIENTOS FUNCIONALES ---------------+

;Dom: flow (flow?), option (option?)
;Rec: flow (flow?)
;Desc: Agrega una option al flujo.
;Recursion: Natural
(define flow-add-option (lambda (flow option)
    (define (check-option options newOption)
        (if (not (null? options))
            (if (= (list-ref (car options) 0) (list-ref newOption 0))
                #f
                (if (null? (cdr options))
                    #t
                    (check-option (cdr options) newOption)
                )
            )
            #t
        )
    )
    (if (check-option (getOptions flow) option)
        (list (getFlowId flow) (getNameMsg flow) (append (getOptions flow) (list option)))
        flow
    ))
)

;Dom: chatbot (chatbot), flow (flow)
;Rec: chatbot (chatbot)
;Desc: A traves de recursion agrega un flujo nuevo al chatbot especificado
;Recursion: natural con la ayuda de una funcion de ayuda (chatbot-add-flow-recursion)
(define (chatbot-add-flow chatbot flow)
    (list (getChatbotId chatbot) (getChatbotName chatbot) (getWelcomeMessage chatbot) (getStartFlowId chatbot) (chatbot-add-flow-recursion (getFlows chatbot) flow))
)

;Dom: system (system?), chatbot (chatbot?)
;Rec: system (system?)
;Desc: Agrega un chatbot al system.
;Recursion: No se usa
(define system-add-chatbot (lambda (system chatbot)
    (define (check-chatbot chatbots newChatbot)
        (if (not (null? chatbots))
            (if (= (list-ref (car chatbots) 0) (list-ref newChatbot 0))
                #f
                (if (null? (cdr chatbots))
                    #t
                    (check-chatbot (cdr chatbots) newChatbot)
                )
            )
            #t
        )
    )
    (if (check-chatbot (getChatbots system) chatbot)
        (list (getSystemName system) (getInitialChatbotCodeLink system) (getLoggedInUser system) (getRegisteredUsers system) (append (getChatbots system) (list chatbot)))
        system
    ))
)

;Dom: system (system?), chatbot (chatbot?)
;Rec: system (system?)
;Desc: Agrega un chatbot al system.
;Recursion: No se usa
(define system-add-user (lambda (system username)
    (define (check-user users newUser)
        (if (not (null? users))
            (if (eq? (list-ref (car users) 0) newUser)
                #f
                (if (null? (cdr users))
                    #t
                    (check-user (cdr users) newUser)
                )
            )
            #t
        )
    )
    (if (check-user (getRegisteredUsers system) username)
        (list   (getSystemName system) 
                (getInitialChatbotCodeLink system)
                (getLoggedInUser system) 
                (append (getRegisteredUsers system) (list (user username)))
                (getChatbots system) 
        )
        system
    )
))

;Dom: system (system), user (user)
;Rec: system
;Desc: Revisa si el usuario se encuentra en la lista de usuarios registrados, si ese es el caso
;       modifica el valor userLoggedIn del TDA para agregar el nickname del usuario recientemente logeado

(define (system-login system user)
    (if (equal? (getLoggedInUser system) "")
        (if (null? (filter (lambda (x) (eq? user (car x))) (getRegisteredUsers system)))
            system
            (list   (getSystemName system) 
                    (getInitialChatbotCodeLink system)
                    user
                    (getRegisteredUsers system)
                    (getChatbots system) 
            ) 
        )
        system
    )
)

;Dom: system (system)
;Rec: system
;Desc: Reinicia el valor del userLoggedIn a "", o sea, nadie
(define (system-logout system)
    (list   (getSystemName system) 
            (getInitialChatbotCodeLink system)
            ""
            (getRegisteredUsers system)
            (getChatbots system) 
   ) 
)

;Dom: system (system), msg (string)
;Rec: system
;Desc: Inicia la conversacion con un chatbot, inicialmente realiza una validacion
;       para comprobrar si el usuario ya habia interactuado con el chatbot para de esta forma
;       saber que opciones, chatbot y flujo debe implementar
;       en caso de que ya haya hablado con el chatbot se debe leer el registro del chat (chaHistory)
;       y a partir de la ultima conversacion, extraer la opcion elegida por el usuario y sacar el flujo
;       en base a la opcion elegida.
(define (system-talk-rec system msg)
    (if (null? (cadar (filter (lambda (x) (equal? (getLoggedInUser system) (list-ref x 0))) (getRegisteredUsers system))))
            (addToChatHistory
                (addToChatHistory 
                    system
                    msg
                    (getLoggedInUser system)
                    (car (filter (lambda (x) (= (getInitialChatbotCodeLink system) (list-ref x 0))) (getChatbots system)))
                )
                (getChatbots (car (filter (lambda (x) (= (getInitialChatbotCodeLink system) (list-ref x 0))) (getChatbots system))))
                (getLoggedInUser system)
                (car (filter (lambda (x) (= (getInitialChatbotCodeLink system) (list-ref x 0))) (getChatbots system)))
            )
        ;Aqui iria la implementacion recursiva si me alcanza el tiempo
        "f"
    )
)

;Dom: system (system), msg (string), sender (string), chatbot (chatbot)
;Rec: system
;Desc: A traves de un map agrega al final del chatHistory del usuario, de esta forma esta ordenado cronologicamente 
(define addToChatHistory (lambda (system msg sender chatbot)
    (list   (getSystemName system) 
            (getInitialChatbotCodeLink system)
            (getLoggedInUser system)
            (map 
                (lambda (x)
                    (if (equal? (car x) sender)
                        (list (car x) (append (cadr x) (chatHistory sender chatbot msg)))
                        x
                    )
                )
                (getRegisteredUsers system)
            )
            (getChatbots system) 
    )
))

(define (system-talk-norec system message)
    (error "No se alcanza a implementar")
)

(define (system-synthesis system user)
    (error "No se alcanza a implementar")
)

(define (system-simulate system maxIterations seed)
    (error "No se alcanza a implementar")
)

                    


(provide (all-defined-out))
