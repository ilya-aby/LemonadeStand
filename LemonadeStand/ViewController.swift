//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Ilya Abyzov on 10/26/14.
//  Copyright (c) 2014 Ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Informational labels
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var lemonLabel: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    
    @IBOutlet weak var buyLemonLabel: UILabel!
    @IBOutlet weak var buyIceLabel: UILabel!
    
    @IBOutlet weak var mixLemonLabel: UILabel!
    @IBOutlet weak var mixIceLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    var lemonStand = LemonBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Reset the game and fetch a random weather pattern
        lemonStand.reset()
        lemonStand.updateWeather()
        
        // Update view with starting values and starting weather
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonPressed(sender: UIButton) {
        
        if(lemonStand.lemonsInMix <= 0) {
            
            showAlertWithText(header: "Whoops", message: "Can't make lemonade without breaking some lemons")
            
        } else if (lemonStand.iceInMix <= 0) {
            
            showAlertWithText(header: "Whoops", message: "Nobody wants to buy straight lemon juice, bro.")
            
        } else {
            
            lemonStand.runDay()
            
            // After day is done, update results and get new weather for the next day
            lemonStand.updateWeather()
            updateMainView()
        }
        
    }
    
    @IBAction func buyLemonPressed(sender: UIButton) {
        if(lemonStand.cash >= lemonStand.lemonPrice) {
            lemonStand.cash -= lemonStand.lemonPrice
            lemonStand.lemons++
            lemonStand.lemonsBought++
        } else {
            showAlertWithText(header: "Whoops", message: "Not enough money to buy more")
        }
        updateMainView()
    }
   
    @IBAction func sellLemonPressed(sender: UIButton) {
        if(lemonStand.lemonsBought >= 1 && lemonStand.lemons >= 1) {
            lemonStand.cash += lemonStand.lemonPrice
            lemonStand.lemons--
            lemonStand.lemonsBought--
        } else {
            // Fail silently
        }
        updateMainView()
    }
    
    @IBAction func buyIcePressed(sender: UIButton) {
        if(lemonStand.cash >= lemonStand.icePrice) {
            lemonStand.cash -= lemonStand.icePrice
            lemonStand.ice++
            lemonStand.iceBought++
        } else {
            showAlertWithText(header: "Whoops", message: "Not enough money to buy more")
        }
        updateMainView()
    }
    
    @IBAction func sellIcePressed(sender: UIButton) {
        if(lemonStand.iceBought >= 1 && lemonStand.ice >= 1) {
            lemonStand.cash += lemonStand.icePrice
            lemonStand.ice--
            lemonStand.iceBought--
        } else {
            // Fail silently
        }
        updateMainView()
    }
    
    @IBAction func addLemonToMixPressed(sender: UIButton) {
        if(lemonStand.lemons >= 1) {
            lemonStand.lemons--
            lemonStand.lemonsInMix++
        } else {
            showAlertWithText(header: "Whoops", message: "Not enough inventory")
        }
        updateMainView()
    }
    
    @IBAction func removeLemonFromMixPressed(sender: UIButton) {
        if(lemonStand.lemonsInMix >= 1) {
            lemonStand.lemons++
            lemonStand.lemonsInMix--
        } else {
            // Fail silently
        }
        updateMainView()
    }
    
    @IBAction func addIceToMixPressed(sender: UIButton) {
        if(lemonStand.ice >= 1) {
            lemonStand.ice--
            lemonStand.iceInMix++
        } else {
            showAlertWithText(header: "Whoops", message: "Not enough inventory")
        }
        updateMainView()
    }
    
    @IBAction func removeIceFromMixPressed(sender: UIButton) {
        if(lemonStand.iceInMix >= 1) {
            lemonStand.ice++
            lemonStand.iceInMix--
        } else {
            // Fail silently
        }
        updateMainView()
    }
    
    func updateMainView() {
        cashLabel.text = "$\(lemonStand.cash)"
        lemonLabel.text = "\(lemonStand.lemons)"
        iceLabel.text = "\(lemonStand.ice)"
        
        buyLemonLabel.text = "\(lemonStand.lemonsBought)"
        buyIceLabel.text = "\(lemonStand.iceBought)"
        
        mixLemonLabel.text = "\(lemonStand.lemonsInMix)"
        mixIceLabel.text = "\(lemonStand.iceInMix)"
        
        // Set the weather icon
        switch lemonStand.weatherIndex {
        case 0:
            weatherImage.image = UIImage(named: "Cold")
        case 1:
            weatherImage.image = UIImage(named: "Mild")
        case 2:
            weatherImage.image = UIImage(named: "Warm")
        default:
            weatherImage.image = UIImage(named: "Cold")
        }
    }
    
    func showAlertWithText(header:String = "Warning",message:String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

