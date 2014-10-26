//
//  LemonBrain.swift
//  LemonadeStand
//
//  Created by Ilya Abyzov on 10/26/14.
//  Copyright (c) 2014 Ilya. All rights reserved.
//

import Foundation
import UIKit

class LemonBrain {
    
    var cash = 10
    var lemons = 1
    var ice = 1
    var lemonsBought = 0
    var iceBought = 0
    var lemonsInMix = 0
    var iceInMix = 0
    
    let lemonPrice = 2
    let icePrice = 1
    
    var weatherIndex = 0 // 0 = Cold, 1 = Mild, 2 = Warm
    
    func runDay() {
        
        // Lemonade logic goes here
        
        
        
        
        // Set up for next day
        self.iceBought = 0
        self.lemonsBought = 0
        self.iceInMix = 0
        self.lemonsInMix = 0
        
        return
    }
    
    func reset() {
        self.cash = 10
        self.lemons = 1
        self.ice = 1
        self.lemonsBought = 0
        self.iceBought = 0
        self.lemonsInMix = 0
        self.iceInMix = 0
    }
    
    func updateWeather() -> Int {
        
        let randomIndex = Int(arc4random_uniform(UInt32(3))) // Random 0-2
        self.weatherIndex = randomIndex
        
        return self.weatherIndex
        
    }
    
}