Algoritmo gestionEmpanaderia
	
	// Mensaje de Bienvenida
	Mostrar "Bienvenido al sistema de gesti�n para venta de empanadas"
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
	
	// Stock empanadas
	Definir stockEmpanadaCarne Como Entero
	stockEmpanadaCarne <- 0
	Definir stockEmpanadaJamonQueso Como Entero
	stockEmpanadaJamonQueso <- 0
	Definir stockEmpanadaHumita Como Entero
	stockEmpanadaHumita <- 0
	
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
	
	// Ingreso caja y stock inicial
	Escribir "Ingrese caja inicial (efectivo)"
	Leer cajaInicial

	Escribir "Ingrese stock inicial de empanadas de carne"
	Leer stockEmpanadaCarne
	Escribir "Ingrese stock inicial de empanadas de jam�n y queso"
	Leer stockEmpanadaJamonQueso
	Escribir "Ingrese stock inicial de empanadas de humita"
	Leer stockEmpanadaHumita
	
	// Men� de opciones
	Repetir
		Mostrar ""
		Mostrar nombreUsuario ", �qu� desea hacer?:"
		Mostrar "1- Realizar una venta"
		Mostrar "2- Ver caja, venta y ganancia diaria"
		Mostrar "3- Ver o modificar stock de mercader�a"
		Mostrar "4- Modificar precios de costo y venta"
		Escribir  "5- Salir"
		Leer opcionMenu
		
		Segun opcionMenu Hacer
			1: // Realizar una venta
				// Ingreso de pedido
				Mostrar ""
				Mostrar "Realizar� una venta. Recuerde que llevando 12 empanadas o m�s, el cliente obtiene un 10% de descuento"
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
					Escribir "Ingrese la cantidad de empanadas de jam�n y queso del pedido"
					Leer pedidoEmpanadaJamonQueso
					si pedidoEmpanadaJamonQueso>stockEmpanadaJamonQueso Entonces
						Mostrar "No es posible vender esa cantidad, hay " stockEmpanadaJamonQueso " empanadas de jam�n y queso en stock"
					FinSi
				Hasta Que pedidoEmpanadaJamonQueso<=stockEmpanadaJamonQueso
				stockEmpanadaJamonQueso <- stockEmpanadaJamonQueso-pedidoEmpanadaJamonQueso
				totalEmpanadasVenta <- totalEmpanadasVenta+pedidoEmpanadaJamonQueso
				
				Repetir
					Mostrar ""
					Escribir "Ingrese la cantidad de empanadas de humita del pedido"
					Leer pedidoEmpanadaHumita
					si pedidoEmpanadaHumita>stockEmpanadaHumita Entonces
						Mostrar "No es posible vender esa cantidad, hay " stockEmpanadaHumita " empanadas de humita en stock"
					FinSi
				Hasta Que pedidoEmpanadaHumita<=stockEmpanadaHumita
				stockEmpanadaHumita <- stockEmpanadaHumita-pedidoEmpanadaHumita
				totalEmpanadasVenta <- totalEmpanadasVenta+pedidoEmpanadaHumita
				
				// C�lculo del monto total y ganancia del pedido
				montoTotalPedido <- totalEmpanadasVenta*precioVentaEmpanada
				
				Repetir
					Mostrar "El monto total a abonar es $" montoTotalPedido ", �c�mo desea abonar?"
					Mostrar "1- Efectivo"
					Escribir "2- Tarjeta"
					Leer medioDePago
				Hasta Que medioDePago==1 o medioDePago==2
				
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
				Mostrar "�Venta exitosa!"
				
			2: // Ver caja, venta y ganancia diaria
				Mostrar ""
				Mostrar "La caja actual (efectivo) es $" cajaInicial+ventaEfectivo
				
				Mostrar ""
				Mostrar "La venta diaria en efectivo es $" ventaEfectivo
				Mostrar "La venta diaria con tarjeta es $" ventaTarjeta
				
				Mostrar""
				Mostrar "La ganancia diara es $" gananciaDiaria
				
			3: // Ver o modificar stock de mercader�a
				Mostrar ""
				Mostrar "Hay " stockEmpanadaCarne " empanadas de carne en stock"
				Mostrar "Hay " stockEmpanadaJamonQueso " empanadas de jam�n y queso en stock"
				Mostrar "Hay " stockEmpanadaHumita " empanadas de humita en stock"
				
				Mostrar ""
				Mostrar "�Desea modificar stock?"
				Mostrar "1- S�"
				Escribir "2- No"
				Leer opcionStock
				
				si opcionStock = 1 Entonces
					Mostrar ""
					Escribir "Ingrese nuevo stock de empanadas de Carne"
					Leer stockEmpanadaCarne
					
					Mostrar ""
					Escribir "Ingrese nuevo stock de empanadas de Jam�n y queso"
					Leer stockEmpanadaJamonQueso
					
					Mostrar ""
					Escribir "Ingrese nuevo stock de empanadas de Humita"
					Leer stockEmpanadaHumita
					
					Mostrar ""
					Mostrar "�El stock fue modificado con �xito!"
				FinSi
				
			4: // Modificar precios de costo y venta
				// Precio de costo (opci�n de modificaci�n)
				Mostrar ""
				Mostrar "El precio de costo actual de cada empanada es de $" precioCostoEmpanada ", �desea modificarlo?"
				Mostrar "1- S�"
				Escribir "2- No"
				Leer opcionCosto
				
				si opcionCosto = 1 Entonces
					Mostrar ""
					Escribir "Ingrese nuevo precio de costo"
					Leer precioCostoEmpanada
	
					Mostrar ""
					Mostrar "�El precio de costo fue modificado exitosamente a $" precioCostoEmpanada "!"
				FinSi
				
				// Precio de venta opci�n de modificaci�n)
				Mostrar ""
				Mostrar "El precio de venta actual de cada empanada es de $" precioVentaEmpanada ", �desea modificarlo?"
				Mostrar "1- S�"
				Escribir "2- No"
				Leer opcionVenta
				
				si opcionVenta = 1 Entonces
					Mostrar ""
					Escribir "Ingrese nuevo precio de venta"
					Leer precioVentaEmpanada
					
					Mostrar ""
					Mostrar "�El precio de Venta fue modificado exitosamente a $" precioVentaEmpanada "!"
				FinSi
		Fin Segun
		
	Hasta Que opcionMenu=5
	
	Mostrar ""
	Mostrar "�Adi�s, " nombreUsuario "!"
	
	
FinAlgoritmo
