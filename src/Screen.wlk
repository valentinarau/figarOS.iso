import wollok.game.* 
import Mixin.*

class Screen inherits Animated{
	const property menu
	const property coins // TODO: class Coin for instance object coins
	const property showCoins
	const property prevScreen
	
	method remove(){
		self.inanimate()
		menu.remove()
		coins.remove()
		self.removeFromGame()
	}
	
	method ret() {
		self.remove()
		prevScreen.display()
	}
	
	method display() {
		if(showCoins) coins.display()
		self.addToGame()
		menu.display()
		self.animateReversed()
	}
}




	

