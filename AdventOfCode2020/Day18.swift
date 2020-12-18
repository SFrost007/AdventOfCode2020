//
//  Day18.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 18/12/2020.
//

import Foundation

class Day18 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).filter { !$0.isEmpty }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return inputData
            .map { Self.calculateResult(equation: $0) }
            .reduce(0, +)
    }
    
    func part2() -> Int {
        return inputData
            .map { Self.calculateResult(equation: $0, plusHasPrecendence: true) }
            .reduce(0, +)
    }
    
    // MARK: - Worker functions
    
    static func calculateResult(equation: String, plusHasPrecendence: Bool = false) -> Int {
        // Remove any bracketed sections recursively
        if let openBracketPos = equation.lastIndex(of: "(") {
            let closeBracketPos = equation[openBracketPos...].firstIndex(of: ")")!
            let rangeIncludingBrackets = openBracketPos...closeBracketPos

            let rangeExcludingBrackets = equation.index(openBracketPos, offsetBy: 1)..<closeBracketPos
            let subEquation = String(equation[rangeExcludingBrackets])
            let subResult = calculateResult(equation: subEquation, plusHasPrecendence: plusHasPrecendence)

            var newEquation = equation
            newEquation.replaceSubrange(rangeIncludingBrackets, with: "\(subResult)")
            return calculateResult(equation: newEquation, plusHasPrecendence: plusHasPrecendence)
        }
        // All brackets have been removed, solve the equation appropriately
        if plusHasPrecendence {
            return solveEquationWithPlusPrecedence(equation)
        } else {
            return solveEquationWithSequentialPrecedence(equation)
        }
    }

    // Part 1
    private static func solveEquationWithSequentialPrecedence(_ equation: String) -> Int {
        var operands = equation.components(separatedBy: .whitespaces)
        while operands.count > 1 {
            let param1 = Int(operands[0])!
            let param2 = Int(operands[2])!
            let result: Int
            switch (operands[1]) {
            case "+":
                result = param1 + param2
            case "*":
                result = param1 * param2
            default:
                fatalError("Unexpected operation: \(operands[1])")
            }
            operands.replaceSubrange(0...2, with: ["\(result)"])
        }
        return Int(operands.first!)!
    }

    // Part 2
    // Assumes that the only operations are "+" and "*"
    private static func solveEquationWithPlusPrecedence(_ equation: String) -> Int {
        var operands = equation.components(separatedBy: .whitespaces)
        while let plusIndex = operands.firstIndex(where: { $0 == "+"} ) {
            let param1 = Int(operands[plusIndex-1])!
            let param2 = Int(operands[plusIndex+1])!
            let result = param1 + param2
            operands.replaceSubrange(plusIndex-1...plusIndex+1, with: ["\(result)"])
        }
        return operands
            .filter { $0 != "*" }
            .compactMap { Int($0) }
            .reduce(1, *)
    }
    
}
