object neo {
    var energia = 100

    method vitalidad(){
        return energia * 0.1
    }

    method saltar(){
        energia = energia * 0.5
    }

    method esElElegido(){
        return true
    }
}

object morfeo {
    var vitalidad = 8
    var cansado = false

    method saltar(){
        vitalidad = vitalidad - 1
        cansado = !cansado
    }

    method vitalidad(){
        return vitalidad
    }

    method esElElegido(){
        return false
    }

}

object trinity{

    method vitalidad(){
        return 0
    } 

    method saltar(){

    }

    method esElElegido(){
        return false
    }

}

object nave {
    const pasajeros = #{neo, morfeo}
    
    method cantidadDePasajeros(){
        return pasajeros.size()
    }

    method pasajeroConMayorVitalidad(){
        return pasajeros.max({
            p => p.vitalidad()
        })
    }

//TERMINAR ESTE MÉTODO
    method estaEquilibrada(){
        return pasajeros.map({
            p => p.vitalidad() / 2
        }).any( {
            v => v > pasajeros.min({
                            p => p.vitalidad()
                        }).vitalidad()
        })
    }

    method elElegidoEstaEnLaNave(){
        return pasajeros.any({
            p => p.esElElegido() 
        }) 
    }

    method chocar(){
        pasajeros.forEach({
            p => p.saltar()
        })
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.forEach({
            p => if(!p.esElElegido()){
                p.saltar()
            }
        })
    }
}
