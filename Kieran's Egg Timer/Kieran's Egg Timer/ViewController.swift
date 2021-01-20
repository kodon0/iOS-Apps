//
//  ViewController.swift
//  Kieran's Egg Timer
//
//  Created by Kieran O'Donnell on 04/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import AVFoundation //For sound

class ViewController: UIViewController {
    
    //    Define time dict
        let eggTimes = ["Soft": (4*60), "Medium":(8*60), "Hard": (12*60)]
    //    Initial value of counter
        var secondsElapsed = 0.0
        var totalTime = 0.0
        var player: AVAudioPlayer!
        
        
        var timer = Timer()
    
    @IBOutlet var eggLabel: UILabel!
    
//    Removed viewDidLoad - no useful code for this method so safe to delete since any superclass that overrides it will still be called
    @IBOutlet var progress: UIProgressView!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
//        Invalidate time and progress before starting
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = Double(Float(eggTimes[hardness]!))
        
//        Reset progress to 0%,elapsed seconds and set title to hardness dictionary
        progress.progress = 0.0
        secondsElapsed = 0.0
        eggLabel.text = hardness
        
    
//        Needed to close IBAction part!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    
    }

    @objc func updateProgress() {
            
            if secondsElapsed < totalTime {
                print("\(secondsElapsed) seconds elapsed till egg is done!")
                secondsElapsed += 1
                
//        Update progress bar by ratio secondsElapsed/totalTime
                progress.progress = Float(secondsElapsed)/Float(totalTime)
            } else {
                timer.invalidate() //Need to invalidate timer or it will keep going and not will keep playing. Can remove this if alarm is wanted!
                eggLabel.text = "Poof! Donezo!"
                playSound(note: "C.wav")
                }
        }
    
//    Plays C Note when timer is done
        func playSound(note: String) {
             let url = Bundle.main.url(forResource: "C", withExtension: "wav")
                 player = try! AVAudioPlayer(contentsOf: url!)
                 player.play()
         }
    }
