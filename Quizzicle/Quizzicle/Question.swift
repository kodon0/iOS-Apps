//
//  Question.swift
//  Quizzicle
//
//  Created by Kieran O'Donnell on 14/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a:String){
        text = q
        answer = a
    }
}
