import wollok.game.* 

object animator {
	
	method animate(o,name,frames,fps){
		var init = frames
		const ms = 1000.div(fps)
		game.onTick(ms,name,{
			o.image(init.head())
			init = init.drop(1)
			if(init.isEmpty()) init = frames.reverse()
		})
	}
	
	method stop(name){
		game.removeTickEvent(name)
	}
}

