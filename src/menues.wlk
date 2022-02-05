import wollok.game.*
import interfaz.*

class Menu inherits Interfaz {
	var imagen = ""
	const property position
	var property puntero = new Puntero (posicionInicial = game.origin())
	
	method inicializar(){
		items.forEach{c=>c.desmarcar()}
	}
	method puntero() = puntero
	override method itemsActuales() = items
	method display(){
		self.inicializar()
		if(imagen != "")game.addVisual(imagen)
		items = self.itemsActuales()
		self.posicionarItems()
		self.agregarPuntero()
	}
	override method removerItems() {
		super()
		game.removeVisual(puntero)
	}
	method agregarPuntero() {
		puntero.position(items.last().position())
		game.addVisual(puntero)
		modo.puntero(puntero)
	}
}


class AreaMenu {
	var inicio
	var proxima = inicio
	var ancho
	var alto
	const distanciaX = 3
	const distanciaY = 1

	method estaLibre(posicion) = game.getObjectsIn(posicion).isEmpty()
	
	method dentroDeArea(posicion) = self.dentroDeAncho(posicion.x()) and self.dentroDeAlto(posicion.y())
	
	
	method dentroDeAlto(posicion){
		if(posicion.between(0,inicio.y()))
			return posicion.between(inicio.y()-alto,inicio.y())
		else return posicion.between(inicio.y(),inicio.y() + alto)
	}
	
	method dentroDeAncho(posicion){
		if(posicion.between(0,inicio.x()))
			return posicion.between(inicio.x()-ancho,inicio.x())
		else return posicion.between(inicio.x(),inicio.x() + ancho)
	}
	
	
	
	method puedePosicionarse(posicion){
		return self.dentroDeArea(posicion) and self.estaLibre(posicion)
	}
	
	method proximaPosicionLibre(){
	const proximasPosiciones = [proxima.up(distanciaY),proxima.right(distanciaX),proxima.down(distanciaY)]
	return proximasPosiciones.find{posicion => self.puedePosicionarse(posicion)}
}
 
	method posicionarItems(items){
		proxima = inicio
		items.forEach{ i => if (self.estaLibre(proxima)) self.posicionarItem(i) proxima = self.proximaPosicionLibre()}
	}
	method posicionarItem(i){
		i.position(proxima)
	}
}


class Interfaz {
	var property items = []
	const area = new AreaMenu(inicio = game.at(0,0),alto=0,ancho=0)
	
	method posicionarItems(){
		area.posicionarItems(items)
		items.forEach({ item => game.addVisual(item) })
	}
	
	method itemsActuales()
	method removerse(){
		self.removerItems()
	}
	method removerItems(){
		self.itemsActuales().forEach{i => game.removeVisual(i)}
	}
	
}
