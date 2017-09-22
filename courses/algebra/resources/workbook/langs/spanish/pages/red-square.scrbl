#lang curr/lib

@(design-recipe-exercise "red-square" "Use la receta de dise�o para escribir una funci�n 'cuadro-rojo', que toma un n�mero (la longitud de cada lado del cuadrado) y regresa un rect�ngulo rojo s�lido cuya longitud y ancho son del mismo tama�o."

			 #:domain-list (list "number")
			 #:range "image"
			 #:purpose "Producir un rect�ngulo con el n�mero dado como ancho y altura"

                         #:num-examples 2
			 #:example-list '((4 (rectangle 4 4 "solid" "red"))	
					  (12 (rectangle 12 12 "solid" "red")))
                         #:param-list (list "size")
                         #:show-params? #f
                         #:body '(rectangle size size "solid" "red")
                         #:show-body? #f
                         )