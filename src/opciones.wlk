import noRecolectables.*
import wollok.game.*
import interfaz.*
import recolectables.*
import tocadiscos.*
import config.*
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

