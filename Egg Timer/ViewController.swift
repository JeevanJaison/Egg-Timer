//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes=["Soft":300,"Medium":420,"Hard":720]
    var secondsRemaining=0
    var reqTime:Int=0
    var player=AVAudioPlayer()
    var timer=Timer()
    var eggType:String=""
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        topLabel.text="\(sender.currentTitle!) Egg selected"
        timer.invalidate()
        progressBar.progress=0.0
        
        eggType=sender.currentTitle!
        print(eggTimes[eggType]!)
        
        secondsRemaining=eggTimes[eggType]!
         reqTime=secondsRemaining
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaining>0{
            print("\(secondsRemaining) Seconds")
            secondsRemaining-=1
            progressBar.progress=1.0-Float(secondsRemaining) / Float(reqTime)
           
        }
        else{
            timer.invalidate()
            topLabel.text="Egg is Done!"
            do{
                player=try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")!))
                topLabel.text="\(eggType) Egg is Done!"
            }
            catch{
                return
            }
            player.play()
        }
    }
    
}
