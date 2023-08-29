Algoritmo gestionEmpanaderia
	
	// Mensaje de Bienvenida
	Mostrar "Bienvenido al sistema de gestión para venta de empanadas"
	Mostrar "Creado por Tomas Deambrosi"
	Mostrar ""
	
	// Ingreso nombre de usuario
	Definir nombreUsuario Como Caracter
	Escribir "Ingrese su nombre para continuar"
	Leer nombreUsuario
	
	// Caja, ventas y ganancia
	Definir cajaInicial Como Real
	cajaInicial <- 0
	
	Definir ventaEfectivo, ventaTarjeta Como Real
	ventaEfectivo <- 0
	ventaTarjeta <- 0
	
	Definir gananciaDiaria como Real
	gananciaDiaria <- 0
	
	// Stock de Mercadería
	Definir stockEmpanadaCarne Como Entero
	stockEmpanadaCarne <- 0
	Definir stockEmpanadaJamonQueso Como Entero
	stockEmpanadaJamonQueso <- 0
	Definir stockEmpanadaHumita Como Entero
	stockEmpanadaHumita <- 0
	
	// Ingreso caja y stock inicial
	Escribir "Ingrese caja inicial (efectivo)"
	Leer cajaInicial

	Escribir "Ingrese stock inicial de empanadas de carne"
	Leer stockEmpanadaCarne
	Escribir "Ingrese stock inicial de empanadas de jamón y queso"
	Leer stockEmpanadaJamonQueso
	Escribir "Ingrese stock inicial de empanadas de humita"
	Leer stockEmpanadaHumita
	
	// Precio empanadas
	Definir precioCostoEmpanada como Real
	precioCostoEmpanada <- 100.5
	Definir precioVentaEmpanada como Real
	precioVentaEmpanada <- 200	
	Definir rentabilidadEmpanada Como Real
	rentabilidadEmpanada <- precioVentaEmpanada-precioCostoEmpanada
	
	// Variables venta
	Definir pedidoEmpanadaCarne Como Entero
	Definir pedidoEmpanadaJamonQueso Como Entero
	Definir pedidoEmpanadaHumita Como Entero
	
	Definir totalEmpanadasVenta Como Entero
	Definir montoTotalPedido Como Real
	Definir gananciaTotalPedido Como Real	
	
	// Menú de opciones
	Repetir
		Mostrar ""
		Mostrar nombreUsuario ", ¿qué desea hacer?:"
		Mostrar "1- Realizar una venta"
		Mostrar "2- Ver caja, venta y ganancia diaria"
		Mostrar "3- Ver o modificar stock de mercadería"
		Mostrar "4- Modificar precios de costo y venta"
		Escribir  "5- Salir"
		Leer opcionMenu
		
		Segun opcionMenu Hacer
			1:
				// Ingreso de pedido
				Mostrar ""
				Mostrar "Realizará una venta. Recuerde que llevando 12 empanadas o más, el cliente obtiene un 10% de descuento"
				totalEmpanadasVenta <- 0
				
				Repetir
					Mostrar ""
					Escribir "Ingrese la cantidad de empanadas de carne del pedido"
					Leer pedidoEmpanadaCarne
					si pedidoEmpanadaCarne>stockEmpanadaCarne Entonces
						Mostrar "No es posible vender esa cantidad, hay " stockEmpanadaCarne " empanadas de carne en stock"
					FinSi
				Hasta Que pedidoEmpanadaCarne<=stockEmpanadaCarne
				stockEmpanadaCarne <- stockEmpanadaCarne-pedidoEmpanadaCarne
				totalEmpanadasVenta <- totalEmpanadasVenta+pedidoEmpanadaCarne
				
				Repetir
					Mostrar ""
					Escribir "Ingrese la cantidad de empanadas de jamón y queso del pedido"
					Leer pedidoEmpanadaJamonQueso
					si pedidoEmpanadaJamonQueso>stockEmpanadaJamonQueso Entonces
						Mostrar "No es posible vender esa cantidad, hay " stockEmpanadaJamonQueso " empanadas de jamón y queso en stock"
					FinSi
				Hasta Que pedidoEmpanadaJamonQueso<=stockEmpanadaJamonQueso
				stockEmpanadaCarne <- stockEmpanadaJamonQueso-pedidoEmpanadaJamonQueso
				totalEmpanadasVenta <- totalEmpanadasVenta+pedidoEmpanadaJamonQueso
				
				Repetir
					Mostrar ""
					Escribir "Ingrese la cantidad de empanadas de humita del pedido"
					Leer pedidoEmpanadaHumita
					si pedidoEmpanadaHumita>stockEmpanadaHumita Entonces
						Mostrar "No es posible vender esa cantidad, hay " stockEmpanadaHumita " empanadas de humita en stock"
					FinSi
				Hasta Que pedidoEmpanadaHumita<=stockEmpanadaHumita
				stockEmpanadaCarne <- stockEmpanadaHumita-pedidoEmpanadaHumita
				totalEmpanadasVenta <- totalEmpanadasVenta+pedidoEmpanadaHumita
				
				// Cálculo del monto total y ganancia del pedido
				montoTotalPedido <- totalEmpanadasVenta*precioVentaEmpanada
				
				Mostrar "El monto total a abonar es $" montoTotalPedido ", ¿cómo desea abonar?"
				Mostrar "1- Efectivo"
				Escribir "2- Tarjeta"
				Leer medioDePago
				
				Segun medioDePago Hacer
					1:
						ventaEfectivo <- ventaEfectivo+montoTotalPedido
					2:
						ventaTarjeta <- ventaTarjeta+montoTotalPedido
				Fin Segun
				
				si totalEmpanadasVenta<12 Entonces
					gananciaTotalPedido <- totalEmpanadasVenta*rentabilidadEmpanada
				SiNo
					gananciaTotalPedido <- (totalEmpanadasVenta*rentabilidadEmpanada)*0.9					
				FinSi
				
				gananciaDiaria <- gananciaDiaria+gananciaTotalPedido
				
				Mostrar ""
				Mostrar "¡Venta exitosa!"
				
			2:
				Mostrar ""
				Mostrar "La caja actual es $" cajaInicial+ventaEfectivo
				Mostrar ""
				Mostrar "La venta diaria en efectivo es $" ventaEfectivo
				Mostrar "La venta diaria con tarjeta es $" ventaTarjeta
				Mostrar""
				Mostrar "La ganancia diara es $" gananciaDiaria
				
			3:
				Mostrar ""
				Mostrar "Hay " stockEmpanadaCarne " empanadas de carne en stock"
				Mostrar "Hay " stockEmpanadaJamonQueso " empanadas de jamón y queso en stock"
				Mostrar "Hay " stockEmpanadaHumita " empanadas de humita en stock"
				
				Mostrar ""
				Mostrar "¿Desea modificar stock?"
				Mostrar "1- Sí"
				Escribir "2- No"
				Leer opcionStock
				
				si opcionStock = 1 Entonces
					Mostrar ""
					Escribir "Ingrese nuevo stock de empanadas de Carne"
					Leer stockEmpanadaCarne
					
					Mostrar ""
					Escribir "Ingrese nuevo stock de empanadas de Jamón y queso"
					Leer stockEmpanadaJamonQueso
					
					Mostrar ""
					Escribir "Ingrese nuevo stock de empanadas de Humita"
					Leer stockEmpanadaHumita
				FinSi
				
			De Otro Modo:
				Mostrar ""
				Mostrar "¡INGRESE UNA OPCIÓN VÁLIDA!"
		Fin Segun
		
	Hasta Que opcionMenu=5
	
	
FinAlgoritmo
