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
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    static func calculateResult(equation: String) -> Int {
        // Remove any bracketed sections recursively
        if let openBracketPos = equation.lastIndex(of: "(") {
            let closeBracketPos = equation[openBracketPos...].firstIndex(of: ")")!
            let rangeIncludingBrackets = openBracketPos...closeBracketPos

            let rangeExcludingBrackets = equation.index(openBracketPos, offsetBy: 1)..<closeBracketPos
            let subEquation = String(equation[rangeExcludingBrackets])
            let subResult = calculateResult(equation: subEquation)

            var newEquation = equation
            newEquation.replaceSubrange(rangeIncludingBrackets, with: "\(subResult)")
            return calculateResult(equation: newEquation)
        }
        // Process equation sequentially as no brackets remain
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
    
}
