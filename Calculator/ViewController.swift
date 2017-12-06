//
//  ViewController.swift
//  Calculator
//
//  Created by oroom on 11/24/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    var typping = false
    var calc = Calculator()
    @IBOutlet weak var resultArea: UILabel!
 
    
    @IBAction func didgitButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        let buttonText = button.titleLabel!.text
        if typping {
            resultArea.text! += buttonText!
        }
        else {
            resultArea.text = buttonText
            typping = true
        }
    }
    
    @IBAction func eraseButtonTapped(_ sender: Any) {
        resultArea.text = "0"
        typping = false
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        if let resultNumber = Double(resultArea.text!) {
            calc.nextNumber(resultNumber)
            if calc.nextOperation == CaclutorOperation.division && resultNumber == 0 {
                resultArea.text = "Error"
            }
            else{
                calc.nextNumber(resultNumber)
                resultArea.text = String(calc.result!)
            }
        }
    }
    
    @IBAction func operationWithButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let inputValueButton = Double(resultArea.text!)
        calc.inputValue = inputValueButton!
        switch button.titleLabel!.text!{
//        case "+":
//            calc.nextOperation = .plus
        case "-":
            calc.nextOperation = .minus
        case "×":
            calc.nextOperation = .multiplie
        case "÷":
            calc.nextOperation = .division
        default:
            resultArea.text = "Error"
        }
        resultArea.text = "0"
    }
    
    @IBAction func operationWithResultButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let inputValueButton = Double(resultArea.text!)
        calc.inputValue = inputValueButton!
        let resultValueButton = Double(resultArea.text!)
        switch button.titleLabel!.text!{
        case "+":
            calc.nextOperation = .plus
        case "±":
            calc.nextOperation = .plusMinus
        case "√":
            calc.nextOperation = .sqrt
        case "x²":
            calc.nextOperation = .doublle
        default:
            resultArea.text = "Error"
        }
        calc.nextNumber(resultValueButton!)
        resultArea.text = String(calc.result!)
    }
    
    
}

