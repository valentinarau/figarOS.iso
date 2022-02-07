import wollok.game.*
import opciones.*
import tocadiscos.*
import recolectables.*
import noRecolectables.*
import menues.*
import config.*

object juego {
	const property opcionesGanar = [asuka,uwu,zeroTwo]
	var property juegoActivo = false
	
	method ganar(){
		game.allVisuals().forEach{v=>game.removeVisual(v)}
		self.mostrarSorpresa()
		game.schedule(6000,{game.allVisuals().forEach{v=>game.removeVisual(v)} pantallaInicio.iniciar()})
	}
	method mostrarSorpresa(){
		game.addVisual(fondo)
        pantallaInicio.animar()
        
        game.addVisual(opcionesGanar.anyOne())
        game.addVisual(yatta)
        
        game.schedule(3000,{game.removeVisual(yatta) game.addVisual(cumple)})
        
	}
	
}

object pantallaInicio {
	const property opciones = [comenzar, musica, creditos , salir]
	const property opcionesGanar = [asuka,uwu,zeroTwo]
	
	method remover(){
		opciones.forEach{ opcion => game.removeVisual(opcion) }
	}
	
	method volver(){
		game.allVisuals().forEach{v=>game.removeVisual(v)}
		if(juego.juegoActivo()){
		game.removeTickEvent("windows")
		game.removeTickEvent("bitcoin")
		}
		self.iniciar()
	}
	
	
	method iniciar() {
        
        juego.juegoActivo(false)
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

class Puntero {
	var property image = "assets/transparente.png"
	var imagenMarcada = comenzar
	var property posicionInicial
	var property position = posicionInicial
	const libre = false
	
	
	
	
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
object modo {
	var property puntero = punteroInicio
	method moverseHacia(lugar){  puntero.moverseHacia(lugar) }
	method seleccionar(){ puntero.seleccionar() }
}