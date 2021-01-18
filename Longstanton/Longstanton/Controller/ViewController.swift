//
//  ViewController.swift
//  Longstanton
//
//  Created by Kieran O'Donnell on 18/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//    var level = 0
    
//    let stories = [Story(title: "You see a fork in the road...", choice1:"Take a left turn.", choice2:"Take a right turn"),
//    Story(title: "You see a dragon...", choice1:"Take your weapon out.", choice2:"Take cover and hide."),
//    Story(title: "You find hidden treasure.", choice1:"Check of booby traps.", choice2:"Open it now"),]

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyLogic = StoryLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        storyLogic.nextStory(userChoice: userChoice)
        
        updateUI()
    }
    func updateUI() {
        storyLabel.text = storyLogic.getStoryTitle()
        choice1Button.setTitle(storyLogic.getChoice1(), for: .normal)
        choice2Button.setTitle(storyLogic.getChoice2(), for: .normal)
    }
}

