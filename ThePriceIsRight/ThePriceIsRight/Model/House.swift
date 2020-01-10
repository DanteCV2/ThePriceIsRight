//
//  House.swift
//  ThePriceIsRight
//
//  Created by Dante Vega on 7/28/19.
//  Copyright © 2019 Dante Vega. All rights reserved.
//

import Foundation

let house = House()

class House: CustomStringConvertible {
    var rooms = 1
    var bathrooms = 1
    var garage = 0
    var year = 1975
    var size = 100
    var condition = 0
    
    var description: String{
        
        let bed = "🛏"
        let bath = "🚽"
        let car = "🚘"
        let star = "⭐️"
        
        var 💤 = ""
        var 🛀🏻 = ""
        var 🏎 = ""
        var 👍🏻  = ""
        
        for _ in 1...rooms{
            💤 = "\(💤)\(bed)"
        }
        
        for _ in 1...bathrooms{
            🛀🏻 = "\(🛀🏻)\(bath)"
        }
        
        if garage > 0 {
            for _ in 1...garage{
               🏎 = "\(🏎)\(car)"
            }
        }
        
        for _ in 0...condition{
            👍🏻  = "\(👍🏻 )\(star)"
        }
        
        return """
        \(NSLocalizedString("houseDescription.text", comment: ""))
        
        \(NSLocalizedString("rooms.number", comment: "")) \(💤)
        \(NSLocalizedString("baths.number", comment: "")) \(🛀🏻)
        \(NSLocalizedString("garage.number", comment: "")) \(🏎)
        \(NSLocalizedString("construction.year", comment: "")) \(year)
        \(NSLocalizedString("surface", comment: "")) \(size) m2
        \(NSLocalizedString("status", comment: "")) \(👍🏻 )
        """
    }
    
    /*var description: String{
        return """
        Descripción de la casa
        ======================
        - Numero de Habitaciones: \(rooms)
        - Número de baños: \(bathrooms)
        - Plazas de garage: \(garage)
        - Año de construcción: \(year)
        - Tamaño: \(size) m2
        - Estado: \(condition+1)/5
        """
    }*/
}
