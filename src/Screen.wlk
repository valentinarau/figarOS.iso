import wollok.game.* 

class Screen {
	const property position
	const property image
	const property menu
	const property coins // TODO: class Coin for instance object coins
	const property showCoins
	const property prevScreen
	
	method ret() {
		menu.remove()
		coins.remove()
		game.removeVisual(self)
		prevScreen.display()
	}
	
	method display() {
		if(showCoins) coins.display()
		game.addVisual(self)
		menu.display()
	}
}




	

