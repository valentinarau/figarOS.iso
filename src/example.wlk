import wollok.game.*
import objects.*
import tocadiscos.*

object modo {
	var property puntero = punteroInicio
	method moverseHacia(lugar){  puntero.moverseHacia(lugar) }
	method seleccionar(){ puntero.seleccionar() }
}

object atras{
	var property text = "Atras"
	var property position = game.at(10,9)
	var color = "FFFFFF"
	
	method textColor() = color
	
	method pulsar(){
		game.removeVisual(mp3)
		menuMusica.removerse()
		pantallaInicio.volver()
		
	}
	
	method marcar(){
		color = "FF0080"
	}
	method desmarcar(){
		color = "FFFFFF"
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



object pantallaInicio {
	const property opciones = [comenzar, musica, creditos , salir]
	const property opcionesGanar = [asuka,uwu,zeroTwo]
	const property opcionesPerder = [rei,angel]
	var property juegoActivo = false
	
	method remover(){
		opciones.forEach{ opcion => game.removeVisual(opcion) }
	}
	method ganar(){
		game.allVisuals().forEach{v=>game.removeVisual(v)}
		self.mostrarSorpresa()
		game.schedule(6000,{game.allVisuals().forEach{v=>game.removeVisual(v)} self.iniciar()})
	}
	
	method mostrarSorpresa(){
		game.addVisual(fondo)
        self.animar()
        
        game.addVisual(opcionesGanar.anyOne())
        game.addVisual(yatta)
        
        game.schedule(3000,{game.removeVisual(yatta) game.addVisual(cumple)})
        
	}
	
	method volver(){
		game.allVisuals().forEach{v=>game.removeVisual(v)}
		if(juegoActivo){
		game.removeTickEvent("windows")
		game.removeTickEvent("bitcoin")
		}
		self.iniciar()
	}
	
	
	method iniciar() {
        
        juegoActivo = false
        cantidadMonedas.inicializar()
        game.addVisual(fondo)
        self.animar()
        menuInicio.display()
        game.addVisual(bitcoinInicio)
        bitcoinInicio.animar()
        modo.puntero(punteroInicio)
        
       
    }
    
    method animar() {
    	fondo.animar()
    }
}

const colisionador = new Puntero(image = "assets/cursor2.png",posicionInicial = game.at(15,3),libre = true)

object figaro{
	var property image = "assets/figaro.png"
	var property position = game.at(12,2)
	
	method meow(){
		game.say(self,"meow")
		tocadiscos.tocar(meow)
	}
	method marcar(){}
	
}

object lauti{
	var property image = "assets/lauti2.gif"
	var property position = game.at(22,0)
	method marcar(){}
}

object monedas{
	var property image = "assets/monedas.png"
	var property position = game.at(18,1)
}
object cantidadMonedas{
	var property position = game.at(21,0)
	var property numero = 0
	var property text = numero.toString()

	method marcar(){}

	method textColor() = "FFFFFF"
	method aumentarMonedas(){
		numero += 1
		text = numero.toString()	}
	method inicializar(){
		numero = 0
		text = numero.toString()
	}
	
}

object fondo{
	var property image = "assets/car1.png"
	var property position = game.origin()
	var imagen1 = "assets/car1.png"
	var imagen2= "assets/car2.png"
	var imagen3= "assets/car3.png"
	var imagen4 = "assets/car4.png"
	var imagenes = [imagen1,imagen2,imagen3,imagen4]
	
method animar(){
	game.onTick(100, "carMoving", { => self.image (imagenes.anyOne() )})
}
}



class Opcion{
	var property imagenR
	var property image
	var property imagenInicial
	var property position
	
	
	method marcar(){
		image = imagenR
		self.image()
	}
	
	method desmarcar(){
		image = imagenInicial
		self.image()
	
	}
	
	
	method pulsar(){
		pantallaInicio.remover()
		game.addVisual(monedas)
        game.addVisual(cantidadMonedas)
        game.addVisual(lauti)
        game.addVisual(figaro)
        game.addVisual(colisionador)
        modo.puntero(colisionador)
        generador.generarBitcoin()
        game.removeVisual(bitcoinInicio)
        game.schedule(1000,{generador.generarWindows()})
        
	}


	
}


object valen{
	var property image = "assets/credits.png"
	var property position = game.at(10,5)
	
	method animar(){
		game.onTick(2000,"creditos",{self.position(game.at(5.randomUpTo(12),3.randomUpTo(11)))} )
	}
	
	}
	

object comenzar inherits Opcion(image = "assets/comenzar.png",imagenR = "assets/comenzarR.png" ,imagenInicial = "assets/comenzar.png",position = game.at(10,9)){
	override method pulsar(){
		pantallaInicio.juegoActivo(true)
		pantallaInicio.remover()
		game.addVisual(monedas)
        game.addVisual(cantidadMonedas)
        game.addVisual(lauti)
        game.addVisual(figaro)
        game.addVisual(colisionador)
        modo.puntero(colisionador)
        generador.generarBitcoin()
        game.removeVisual(bitcoinInicio)
        game.schedule(1000,{generador.generarWindows()})
        
	}
}

object creditos inherits Opcion(image = "assets/creditos.png",imagenR = "assets/creditosR.png",imagenInicial = "assets/creditos.png",position = game.at(10,7)){
	
	override method pulsar(){
		pantallaInicio.remover()
		game.addVisual(valen)
		game.removeVisual(punteroInicio)
		valen.animar()
	}
	
}

object musica inherits Opcion(imagenR = "assets/MusicaR.png",image = "assets/musica.png",imagenInicial = "assets/musica.png",position = game.at(10,8)){
	
	override method pulsar(){
		pantallaInicio.remover()
		game.removeVisual(punteroInicio)
		menuMusica.display()
		
	}
	
}

object salir inherits Opcion(imagenR= "assets/salirR.png",image = "assets/salir.png",imagenInicial = "assets/salir.png",position = game.at(10,6)){
	
	override method pulsar(){
		tocadiscos.tocar(windowsApagar)
		game.schedule(2000,{game.stop()})
	}
	
}

const punteroInicio = new Puntero(posicionInicial = game.at(10, 9))
class Puntero {
	var property image = "assets/transparente.png"
	var imagenMarcada = comenzar
	var property posicionInicial
	var property position = posicionInicial
	var libre = false
	
	
	
	
	method volveAlPrincipio() {
		position = posicionInicial
	}
	method moverseHacia(donde){
		if (!libre){if (donde.hayElementos(position)){
			position = donde.mover(position)
			self.marcar()
		}
		
		}
		else{
			position = donde.mover(position)
			self.marcar()
		
		}
		
	}

	
	method marcar(){
		
		if(!libre){
			self.desmarcar()
			imagenMarcada = game.uniqueCollider(self)
			game.uniqueCollider(self).marcar()}
		else{
			game.colliders(self).forEach{c => c.marcar()}
		}
		}
	
	
	method desmarcar(){
		imagenMarcada.desmarcar()
		
	}

	method seleccionar() {
		if(!game.getObjectsIn(position).isEmpty()){
	
			game.colliders(self).forEach{c => c.pulsar()}
		}
		}
	
	
	
}


class Direccion{
	var property sentido
	var lugares
	method mover(unaPosicion) = sentido.mover(unaPosicion,lugares) 
	method hayElementos(posicion) = !game.getObjectsIn(sentido.mover(posicion,lugares)).isEmpty()
}

object arriba  {
	 method mover(posicion,lugares) = posicion.up(lugares)
	 
}

object abajo  {
	 method mover(posicion,lugares) = posicion.down(lugares)
}

object izquierda  {
	 method mover(posicion,lugares) = posicion.left(lugares)
}

object derecha  {
	 method mover(posicion,lugares) = posicion.right(lugares)
}


const opcionArriba = new Direccion (lugares = 1,sentido = arriba)
const opcionAbajo = new Direccion(lugares = 1,sentido= abajo)
const opcionDerecha = new Direccion(lugares = 1,sentido= derecha)
const opcionIzquierda = new Direccion(lugares = 1,sentido= izquierda)


const menuInicio = new Menu(
	position = game.at(1,0),
	area = new AreaMenu(inicio = game.at(10,6), alto = 4, ancho = 1),
	items = [salir,creditos,musica,comenzar],
	puntero = punteroInicio
)
