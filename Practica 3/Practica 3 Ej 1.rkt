;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;EJERCICIO 1

; dibujarCirculo: String -> Image
(define (dibujaCirculo c)
  (circle 10 "solid" c))
 
; pantalla: Estado -> Image
(define (pantalla c)
  (place-image (dibujaCirculo c) 150 150
     (empty-scene 300 300)))

; eventosMouse: Estado Número Número String -> Estado
(define (eventosMouse c x y e)
  (cond [(mouse=? e "move") "white"]
        [else c]))

; eventosTeclado: Estado String -> Estado
(define (eventosTeclado c k)
  (cond [(key=? k "a") "blue"]
        [(key=? k "r") "red"]
        [(key=? k "v") "green"]
        [(key=? k "n") "black"]
        [else c]))

(big-bang "blue"; estado inicial del sistema
          [to-draw pantalla]       ; dibuja en la pantalla 
                                   ; el círculo en el estado actual
          [on-key eventosTeclado]  ; cuando se presiona una tecla,
                                   ; la función eventosTeclado
                                   ; se invoca para manejar el evento
          [on-mouse eventosMouse]  ; cuando el mouse es utilizado,
                                   ; la función eventosMouse
                                   ; se invoca para manejar el evento
          )
