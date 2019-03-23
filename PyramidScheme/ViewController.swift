//
//  ViewController.swift
//  PyramidScheme
//
//  Created by Aidan Maldonado on 3/22/19.
//  Copyright © 2019 Aidan Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Game Variables
    var money = 0
    var day = 1
    var drivers = 0
    var pay = 0
    var tip = 0
    var gas = 5
    var gameTick = 0
    
    //Labels
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var gasLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateLabels() {
        moneyLabel.text = "$\(money)"
        dayLabel.text = "Day \(day)"
        driverLabel.text = "Drivers: \(drivers)"
        gasLabel.text = gasVariable()
        payLabel.text = "Pay: $\(pay) + Tip: $\(tip)"
    }
    
    func gasVariable() -> String {
        var display = ""
        switch gas {
        case 1:
            display = "+----"
        case 2:
            display = "++---"
        case 3:
            display = "+++--"
        case 4:
            display = "++++-"
        case 5:
            display = "+++++"
        default:
            display = "---"
        }
        return display
    }
    
    @IBAction func deliveryButton() {
        if gas > 1 {
            pay = 4
            tip = Int.random(in: 0...25)
            money += pay + tip
            gas -= 1
            updateLabels()
        } else {
            payLabel.text = "You need to get towed. The nearest company charges $\(money / 2)"
            money -= (money / 2)
            gas = 5
            updateLabels()
        }
        gameTick += 1
        
        if gameTick >= 5 {
            gameTick = 0
            day += 1
        }
        updateLabels()
        
    }
    
    @IBAction func gasButton() {
        if money >= 20 {
            gas = 5
            money -= 20
        }
        updateLabels()
    }
    
    @IBAction func hireDriver() {
        drivers += 1
        money -= 200
        updateLabels()
    }
}

