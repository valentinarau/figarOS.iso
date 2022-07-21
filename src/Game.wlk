import Animator.*
import wollok.game.*  


class Game {
//	TODO: const property level
//	const property characters maybe not necessary
	const property pointer
	const property views // [[[frames, ...],[characters, ...]],[[frames, ...],[characters, ...]]]
	var property currentView // [[frames, ...],[characters, ...]]
	var property image
	var property coins
	var property active
	
	method start(){
		self.animate()
		game.addVisual(self)
		game.addVisualCharacter(pointer)
		coins.display()
		active = true
	}
	// check if explodes
	method animate(){
		const frames = currentView.first()
		animator.animate(self,"views",frames,20) // TODO: add config for ViewFPS, CoinFPS, etc...
		self.addCharacters()
	}
	
	method stopAnimation(){
		animator.stop("views")
		self.removeCharacters()
	}
	
	method removeCharacters(){
		currentView.last().forEach({c => c.remove()})
	}
	
	method addCharacters(){
		currentView.last().forEach({c => c.display()})
	}
	
	method changeView(){
		self.stopAnimation()
		currentView = views.filter({v => v.first() != currentView.first()}).first()
		self.animate()
	}
	
	method stop(reason){
		self.stopAnimation()
		game.removeVisual(self)
		game.removeVisual(pointer)
		coins.remove()
		active = false
		reason.action()
	}
		
}
