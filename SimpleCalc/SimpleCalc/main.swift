//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let possibleFunctionWord:String = args[args.count - 1]
        let arrayLength:Int = Int(args.count)
        switch possibleFunctionWord {
        case "count":
            if arrayLength == 1 {
                return 0
            }
            return arrayLength - 1
            
        case "avg":
            if arrayLength == 1 {
                return 0
            }
            var sum = 0
            for i in 0..<(args.count - 1) {
                let num:Int = Int(args[i])!
                sum = sum + num
            }
            let result = sum / (arrayLength - 1)
            return result
            
        case "fact":
            if arrayLength == 1 {
                return 0
            }
            let num:Int = Int(args[0])!
            if num == 0 {
                return 1
            }
            var answer = 1
            for i in 1...num {
                answer = i * answer
            }
            return answer
            
        default:
            let n1:Int = Int(args[0])!
            let n2:Int = Int(args[2])!
            let functionSign:String = args[1]
            switch functionSign {
            case "+":
                return Int(n1 + n2)
                
            case "-":
                return Int(n1 - n2)
                
            case "/":
                return Int(n1 / n2)
                
            case "%":
                return Int(n1 - ((n1 / n2) * n2))
                
            case "*":
                return Int(n1 * n2)
                
            default:
                return 0
            }
        }
    
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))
