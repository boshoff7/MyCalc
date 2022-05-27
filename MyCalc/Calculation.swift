//
//  CalcLogic.swift
//  MyCalc
//
//  Created by Chris Boshoff on 2022/03/10.
//

import Foundation

class Calculation {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    func setNumber(_ number: Double) {
        self.number = number
    }

    func calculate(symbol: String) -> Double? {
      
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "AC" {
                return 0
            }  else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
            } else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
            return nil
        }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation  {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
               fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
        
    }

    
}
