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
    var player: AVAudioPlayer!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]

var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    @IBOutlet weak var viewLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
       
        progressBar.progress = 0.0
        secondsPassed = 0
        viewLabel.text = hardness
        
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    }
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
       
        }else{
            timer.invalidate()
            playSound()
            viewLabel.text = "DONE"
        }

        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
   
    
}
