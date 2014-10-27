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
    let lemonadePrice = 1
    
    let coldPenalty = 3
    let warmBonus = 4
    
    var weatherIndex = 0 // 0 = Cold, 1 = Mild, 2 = Warm
    
    func runDay() {
        
        println("==Starting Day==")
        
        var revenue = self.cash
        var costs = self.iceInMix * self.icePrice + self.lemonsInMix * self.lemonPrice
        
        var ratio = Double(self.lemonsInMix) / Double(self.iceInMix)
        println("Lemonade ratio = \(ratio)")
        
        var randomCustomers = Int(arc4random_uniform(UInt32(10)))+1 // Random 1-10
        
        // Weather Logic
        switch weatherIndex {
        case 0:
            randomCustomers = max(randomCustomers - coldPenalty, 0) // Don't allow negative customers
            println("Received Cold penalty")
        case 2:
            randomCustomers += warmBonus
            println("Received Warm bonus")
        default:
            randomCustomers += 0
        }
        
        println("Customers: \(randomCustomers)")
        
        // Purchasing Engine
        for var i = 1; i <= randomCustomers; i++ {
            var randomPreference = Double(arc4random_uniform(UInt32(11)))/10.0 // Random 0-10 --> 0.0-1.0
            println("Customer \(i) has preference \(randomPreference)")
            
            switch randomPreference {
            case 0.0, 0.1, 0.2, 0.3:
                if(ratio > 1) {
                    cash += lemonadePrice
                    println("Customer \(i) liked and bought acidic lemonade")
                } else {
                    println("Customer \(i) didn't buy lemonade - it wasn't acidic enough")
                }
            case 0.4, 0.5, 0.6:
                if(ratio == 1) {
                    cash += lemonadePrice
                    println("Customer \(i) liked and bought equal-mixed lemonade")
                } else {
                    println("Customer \(i) didn't buy lemonade - it wasn't equal enough")
                }
            case 0.7, 0.8, 0.9, 1.0:
                if(ratio < 1) {
                    cash += lemonadePrice
                    println("Customer \(i) liked and bought diluted lemonade")
                } else {
                    println("Customer \(i) didn't buy lemonade - it wasn't diluted enough")
                }
            default:
                println("Something weird happened")
            }
        }
        
        revenue = self.cash - revenue
        
        println("==End of Day: Revenue was $\(revenue); Costs were $\(costs); Net Income was $\(revenue-costs)==")
        
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