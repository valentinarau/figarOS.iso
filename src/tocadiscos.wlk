import wollok.game.*
import config.*

object tocadiscos {
	var cancionCreditos
	var property cancionActual = "assets/sunset-breeze.mp3"
	var property fondo 
	
    method tocar(ruta) {
        const sonido = game.sound(ruta)
        sonido.play()
    }
    
    method iniciar(){
    	game.schedule(3000,{self.tocarFondo(self.cancionActual())})
    }
    
    method tocarFondo(ruta){
    	fondo=game.sound(ruta)
    	fondo.shouldLoop(true)
    	fondo.volume(0.5)
    	fondo.play()
    }
    
    method tocarCreditos() {
    	cancionCreditos=game.sound(cancionActual)
    	cancionCreditos.play()
    }
    
    method detenerfondo() {
    	fondo.stop()
    }
    
    method detenerCreditos() {
    	cancionCreditos.stop()
    }
}

class Cancion{
	var property text
	var sonido
	var property position = game.origin()
	var color = "ffffff"
	
	method textColor() = color
	
	method marcar(){
		color = "FF0080"
	}
	method desmarcar(){
		color = "FFFFFF"
	}
	
	method pulsar(){
		tocadiscos.detenerfondo()
		tocadiscos.tocarFondo(sonido)
		tocadiscos.cancionActual(sonido)
		
	}
	
	
}

const persona51 = new Cancion(text = "Battle For Everyone Soul(Persona 5)", sonido = persona5db)


const darkLine = new Cancion(text = "Dark Line(Gran Turismo)", sonido = gtDarkLine)


const afterRace = new Cancion(text ="Lounge After the Race (Gran Turismo)", sonido = gtAfterRace)


const lotus = new Cancion(text = "Lotus in Dam(Gran Turismo)", sonido = gtLotus)


const sunset = new Cancion (text = "Sunset Breeze(Gran Turismo)", sonido = gtSunset)




object mp3{
	var property position = game.at(2,0)
	var property image = "assets/celu.png"
}


