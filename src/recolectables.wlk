import wollok.game.*
import config.*
import tocadiscos.*
import noRecolectables.*
import interfaz.*

class Windows{
	var property imagenes = ["assets/wxp.png","assets/w2000.png","assets/w98.png"]
	var property image = "assets/wxp.png"
	var property position = game.origin()
	
	method tirarError(){ 
		error.image(errores.anyOne()) 
		game.addVisualIn(error,game.at(13,3.randomUpTo(6))) 
		tocadiscos.tocarFondo(errorWindows)
		game.schedule(2000,{game.stop()})
	}
	
	method marcar(){
		self.tirarError()
	}
}
object error{
	var property image = "assets/werror.png"
	var property position = game.origin()
}

class Bitcoin{
	const angulos = [bitcoinFrente,bitcoin34,bitcoinChata,bitcoin43,bitcoinAtras,bitcoin43,bitcoinChata,bitcoin34]
	var property image = bitcoinFrente
	var property position = game.origin()
	
	
	method marcar(){
		game.removeVisual(self)
		cantidadMonedas.aumentarMonedas()
		figaro.meow()
	}
	
	method animar(){
	var anterior = angulos

		game.onTick(500,"moverBitcoin",{=>  anterior = anterior.drop(1) if(anterior.size()==0) {anterior = angulos} self.image(anterior.head()) })
	}
}

object generador{
	
	method generarBitcoin(){
		game.onTick(3000,"bitcoin",{=> if (cantidadMonedas.numero()>10) {game.removeTickEvent("bitcoin") game.removeTickEvent("windows") game.schedule(500,{pantallaInicio.ganar()}) }
			var bitcoin = new Bitcoin(position = game.at(1.randomUpTo(21),4.randomUpTo(11))) game.addVisual(bitcoin) bitcoin.animar() 
	})
	
	}
	
	method generarWindows(){
		game.onTick(5000,"windows",{=>  var bug = new Windows () bug.image(bug.imagenes().anyOne()) if(cantidadBugs.numero() >10){bug.tirarError() } else {cantidadBugs.aumentarBugs()} game.addVisualIn(bug,game.at(1.randomUpTo(21),4.randomUpTo(11)))})
	}
	
	

}
object cantidadBugs{
	
	var property numero = 0

	method aumentarBugs(){
		numero += 1
	}

}