import wollok.game.*
import Game.*

/**
 * Animated mixin, for animating objects 
 * Dependencies: method image()
 */

mixin Animated inherits Visual{
	var property frames
	const property fps
	const property name	
	
	 method animateReversed(){
		var init = frames
		const ms = 1000.div(fps)
		game.onTick(ms,name,{
			self.image(init.head())
			init = init.drop(1)
			if(init.isEmpty()) init = frames.reverse()
		})
	}
	
	method inanimate(){
		game.removeTickEvent(name)
	}
	
	
	override method display(){
		super()
		self.animateReversed()
	}
	
	override method remove(){
		self.inanimate()
		super()
		
	}
	
	override method image(_image) {super(_image)}
	
	//method image(_image) 
	
}

/**
 * Visual mixin, for visual objects on screen
 * Dependencies: None
 */

mixin Visual{
	var property image
	
	method removeFromGame(){game.removeVisual(self)}
	method addToGame(){game.addVisual(self)}

}


// Alternativa: no heredar de visual porque no agrega mucho valor








// TODO: add different animation methods?





