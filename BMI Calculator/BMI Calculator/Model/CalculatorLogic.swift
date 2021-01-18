//
//  CalculatorLogic.swift
//  BMI Calculator
//
//  Created by Kieran O'Donnell on 18/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

struct CalculatorLogic{
    
    var bmi: BMI?
    mutating func calculateBMI(height:Float, weight:Float) {
        let bmiValue = weight/powf(height, 2.0)
        
        if (bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advice: "You should eat more!", color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        } else if (bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "Normal weight!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "You are overweight - do some workouts!", color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiString
    }
    
    func getAdvice() -> String {
        let adviceString = bmi?.advice ?? "N/A"
        return adviceString
    }
    
    func getColor() -> UIColor {
        let colorLiteral = bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return colorLiteral
    }
}

