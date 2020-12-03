//
//  Day3.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 03/12/2020.
//

import Foundation

class Day3 {
    
    // MARK: - Initialisation
    
    let inputData: [[Bool]]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines)
            .map { $0.map { $0 == "#" } }
            .filter { !$0.isEmpty } // Remove trailing empty line
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return Self.checkForTrees(in: inputData, xMovement: 3, yMovement: 1)
    }
    
    func part2() -> Int {
        return [
            Self.checkForTrees(in: inputData, xMovement: 1, yMovement: 1),
            Self.checkForTrees(in: inputData, xMovement: 3, yMovement: 1),
            Self.checkForTrees(in: inputData, xMovement: 5, yMovement: 1),
            Self.checkForTrees(in: inputData, xMovement: 7, yMovement: 1),
            Self.checkForTrees(in: inputData, xMovement: 1, yMovement: 2)
        ].reduce(1, *)
    }
    
    // MARK: - Worker function
    
    static func checkForTrees(in input: [[Bool]], xMovement: Int, yMovement: Int) -> Int {
        var x = 0, y = 0, trees = 0
        while y < input.count {
            trees += input[y][x] ? 1 : 0
            x = (x + xMovement) % input[y].count
            y += yMovement
        }
        return trees
    }
    
}
