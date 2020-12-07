//
//  ViewController.swift
//  Kieran's Magic 8 Ball
//
//  Created by Kieran O'Donnell on 07/12/2020.
//  Copyright © 2020 Kieran O'Donnell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    Set image
    @IBOutlet weak var imageView: UIImageView!
//    Recieve action
    @IBAction func askButton(_ sender: UIButton) {
// Takes in action from button
    let ballArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball7"), #imageLiteral(resourceName: "ball8"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: " ball4"), #imageLiteral(resourceName: "ball3"),]
    //  Random selection of dice array
    imageView.image = ballArray[Int.random(in: 0...7)]
    }
}

