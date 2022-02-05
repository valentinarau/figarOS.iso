import wollok.game.*
import example.*

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
	var cancionActual = ""
	
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



const menuMusica = new Menu(
	imagen = mp3,
	position = game.at(1,0),
	area = new AreaMenu(inicio = game.at(9,4), alto = 5, ancho = 5),
	items = [atras,persona51,darkLine,afterRace,lotus,sunset]
	)

object mp3{
	var property position = game.at(2,0)
	var property image = "assets/unnamed.png"
}


const canciones = [persona5db,gtDarkLine,gtAfterRace,gtLotus,gtSunset]
const meow = "assets/cat-meow-2.mp3"
const windowsApagar = "assets/windowsApagar.mp3"
const errorWindows = "assets/errorSonido.mp3"
const persona5db = "assets/battleForEveryoneSoul.mp3"
const gtDarkLine = "assets/dark-line.mp3"
const gtAfterRace = "assets/lounge.mp3"
const gtLotus = "assets/lotus-in-dam.mp3"
const gtSunset = "assets/sunset-breeze.mp3"
