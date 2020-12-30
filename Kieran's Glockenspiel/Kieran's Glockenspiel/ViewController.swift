//
//  ViewController.swift
//  Kieran's Glockenspiel
//
//  Created by Kieran O'Donnell on 16/12/2020.
//  Copyright © 2020 baxmanduppa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // Gets title of button, prints it with crrentTitle

        print("\(sender.currentTitle) got pressed!")
                
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.6

        //Code should execute after 0.1 second delay.
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
             //Bring's sender's opacity back up to fully opaque.
             sender.alpha = 1.0
            
        // Plays sound based on note
        self.playSound(note: sender.currentTitle!)
          }
        }
    // Define a note: String
    func playSound(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
}
