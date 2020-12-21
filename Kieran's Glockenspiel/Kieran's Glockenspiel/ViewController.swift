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
        
        print("I get pressed")
        playSound()
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
}
