/*
 * La variable valor en la clase Menta no es necesaria.
 * En el método daNuevasSemillas() de soja, faltó la condición de altura > 1
 * 
 * En el método espacioQueOcupa() de Hierbabuena el valor era super()*2 y no super()*3
 * 
 * La forma en que está resuelto si la planta se asocia bien en cada parcela no está
 * respetando por completo el polimorfismo, ya que a cada planta, independientemente 
 * del tipo de parcela donde se asocie, debería poder preguntarle si se asocia bien a cualquier parcela, 
 * y podrían existir luego otros tipos de parcelas como nuevas subclases de Parcela, lo que
 * te llevaría a tener que modificar el código en Planta. Lo ideal sería implementar la 
 * solución de buena asociación en la clase Parcela, ya que las condiciones de la planta
 * son comunes a todas. Si borrar tu código, te dejo una posible solución dentro de la clase
 * Parcela.
 */

import parcelas.*

class Planta {
	var property anio
	var property altura 
	
	method horasDeSolQueTolera() 
	method esFuerte() = self.horasDeSolQueTolera() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacioQueOcupa() = 0
	method esIdealLaParcela(parcela) 
	method seAsociaBienAEco(parcelaEco) = self.horasDeSolQueTolera() > parcelaEco.horasAlSol() and self.esIdealLaParcela(parcelaEco)
	method seAsociaBienAIndus(parcelaInd) = self.esFuerte() 
}

class Menta inherits Planta {
	var property valor = 0
	
	override method horasDeSolQueTolera() = 6
	override method daNuevasSemillas() = super() or altura > 0.4
	override method espacioQueOcupa() = altura * 3
	override method esIdealLaParcela(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
	override method horasDeSolQueTolera() = 
		if(altura < 0.5) { 6 }
		else if (altura <= 1) { 7 }
		else { 9 }
	override method espacioQueOcupa() = altura*0.5
	override method daNuevasSemillas() = super() or (anio > 2007 and altura > 1)
	override method esIdealLaParcela(parcela) = parcela.horasAlSol() == self.horasDeSolQueTolera()
}
class Quinoa inherits Planta {
	var horasAlSolQueTolera
	
	override method horasDeSolQueTolera() = horasAlSolQueTolera
	override method espacioQueOcupa() = 0.5
	override method daNuevasSemillas() = super() or anio < 2005
	override method esIdealLaParcela(parcela) = parcela.plantasNoPasanDe(1.5)
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esIdealLaParcela(parcela) = parcela.cantidaMaximaDePlantasQueTolera() == 1
}

class HierbaBuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
}