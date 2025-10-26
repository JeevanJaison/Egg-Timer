//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes=["Soft":3,"Medium":4,"Hard":7]
    var secondsRemaining=0
    
    var timer=Timer()
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        topLabel.text="\(sender.currentTitle!) Egg selected"
        timer.invalidate()
        
        var eggType=sender.currentTitle!
        print(eggTimes[eggType]!)
        
        secondsRemaining=eggTimes[eggType]!
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaining>0{
            print("\(secondsRemaining) Seconds")
            timerLabel.text="\(secondsRemaining) Seconds"
            secondsRemaining-=1
        }
        else{
            timer.invalidate()
            topLabel.text="Egg is Done!"
            timerLabel.text="Enjoy your Egg!"
        }
    }
    
}
