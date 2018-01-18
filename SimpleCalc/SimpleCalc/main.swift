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
        let eqLength = args.count
        switch args[eqLength - 1] {
        case "count":
            return eqLength - 1
        case "avg":
            if(eqLength == 1) {
                return 0
            }
            var sum = 0
            for i in 0...(eqLength - 1) {
                if(args[i] != "avg") {
                    sum += Int(args[i])!
                }
            }
            return sum / (eqLength - 1)
        case "fact":
            if(eqLength == 1) {
                return 0
            } else {
                let num = Int(args[0])!
                return fact(num)
            }
        default:
            switch args[1]{
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            case "/":
                return Int(args[0])! / Int(args[2])!
            case "%":
                return Int(args[0])!-((Int(args[0])! / Int(args[2])!) * Int(args[2])!)
            default:
                return 0
            }
        }
    }
    
    public func fact(_ num: Int) -> Int {
        if(num == 1 || num == 0) {
            return 1;
        }
        return fact(num - 1) * num
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

