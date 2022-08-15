import Animator.*
import wollok.game.*  
import Mixin.*


class Game inherits Animated{
//	TODO: const property level
//	const property characters maybe not necessary
	const property pointer
	const property views // [[[frames, ...],[characters, ...]],[[frames, ...],[characters, ...]]]
	var property currentView // [[frames, ...],[characters, ...]]
	//var property image
	var property coins
	var property active
	
	method start(){
		self.animateWithCharacters()
		game.addVisual(self)
		pointer.display()
		coins.display()
		active = true
	}
	// check if explodes
	/*method animate1(){
		const frames = currentView.first()
		animator.animate(self,"views",frames,20) // TODO: add config for ViewFPS, CoinFPS, etc...
		self.addCharacters()
	}
	
	method stopAnimation(){
		animator.stop("views")
		self.removeCharacters()
	}
	*/
	method animateWithCharacters(){
		frames = currentView.first()
		self.animateReversed()
		self.addCharacters()
	}
	
	override method inanimate(){
		super()
		self.removeCharacters()
	}
	
	
	method removeCharacters(){
		currentView.last().forEach({c => c.remove()})
	}
	
	method addCharacters(){
		currentView.last().forEach({c => c.display()})
	}
	
	method changeView(){
		//self.stopAnimation()
		self.inanimate()
		currentView = views.filter({v => v.first() != currentView.first()}).first()
		self.animateWithCharacters()
	}
	
	method stop(){
		self.inanimate()
		game.removeVisual(self)
		pointer.remove()
		coins.remove()
		active = false
	}	
}

object hitCoin{
	method apply(g){
		g.sumCoins()
		// figaro nice meow
	}
}

object quitGame{
	method apply(g){
		// display total coins screen
		g.stop()
	}
}

object hitBug{
	method apply(g){
		g.stop()
		// display loose screen
		// sound bug
		
	}
}


