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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonPressed(sender: UIButton) {
        println("Starting Day")
    }

}

