//
//  ViewController.swift
//  MyCalc
//
//  Created by Chris Boshoff on 2022/03/10.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberDisplayLabel: UILabel!
    
    private var finishedTypingNumber: Bool = true
    
    // Computed properties
    private var displayValue: Double {
        get {
            guard let number = Double(numberDisplayLabel.text!) else {
                fatalError("Could't convert display label text to double")
            }
            return number
        }
        set {
            numberDisplayLabel.text = String(newValue)
            
        }
    }
    
    private var calculator = Calculation()
    
    // What should happen when a calc button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        if numberDisplayLabel.text! == "." {
            numberDisplayLabel.text = "0"
            return
        }
            
            finishedTypingNumber = true
        
        calculator.setNumber(displayValue)
     
        if let calcMethod = sender.currentTitle {
           
           if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
          
        }
    
    }

    // What should happen when a number is entered into the key pad
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        // Display number tapped in numberDisplayLabel
        // set property for currentTitle of button pressed
        if let numValue = sender.currentTitle {
            
             if finishedTypingNumber == true {
                numberDisplayLabel.text = numValue
                finishedTypingNumber = false
            } else {
                
                if numValue == "." && numberDisplayLabel.text!.contains(".") {
                        return
                    } else {
                        // if not done typing, append new number to already typed number
                        numberDisplayLabel.text = numberDisplayLabel.text! + numValue
                    }
                   
                }
               
            }
  
        }
    
    
    @IBAction func backspacePressed(_ sender: UIButton) {
        
        guard
                let text = numberDisplayLabel.text,
                !text.isEmpty
            else {
                return
            }
            numberDisplayLabel.text = String(text.dropLast())
    
    }


}


