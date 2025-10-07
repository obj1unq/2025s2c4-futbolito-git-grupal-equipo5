/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)

	var property esTitular = true 

	method estado() {
	  return if(esTitular){"lionel-titular.png"}
	  else {
		"lionel-suplente.png"
		}
	}
	
	method image() {
		return self.estado()
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method validarSiPuedeCambiarCamiseta() {
	  if(position.x()!=0){
		self.error("No esta en la posicion para cambiar la camiseta")
	  }
	}

	method cambiarCamiseta() {
	  self.validarSiPuedeCambiarCamiseta()
	  if (esTitular) {
        esTitular = false
    } else {
        esTitular = true
    }
	
	}

	method levantarla(pelota) {
		if(self.position() == pelota.position()){
			pelota.levantarse()
		}
	}
	
	method validarQuePuedoPatear() {
		if (pelota.position() != position) {
			self.error("No estoy sobre la pelota")
		}
	}

	method darPaseTaquito() {
		self.validarQuePuedoPatear()
		pelota.retroceder(2)
	}
	
	method patear(){
		if (position == pelota.position()){
			pelota.mover()
		}

	}

}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method levantarse() {
	  position = position.up(1)
	  game.schedule(2000, {position =position.down(1)})
	}
	
	method retroceder(cantPosiciones) {
		position = game.at((position.x() - 2).max(0), position.y())
	}

	method mover(){
		position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}	
}
