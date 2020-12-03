//
//  Day3.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 03/12/2020.
//

import Foundation

class Day3 {
    
    static func parseInput(from url: URL) -> [[Bool]] {
        return try! String(contentsOf: url).components(separatedBy: .newlines)
            .map { $0.map { $0 == "#" } }
            .filter { !$0.isEmpty } // Remove trailing empty line
    }
    
    static func part1(input: [[Bool]]) -> Int {
        return checkForTrees(in: input, xMovement: 3, yMovement: 1)
    }
    
    static func part2(input: [[Bool]]) -> Int {
        return [
            checkForTrees(in: input, xMovement: 1, yMovement: 1),
            checkForTrees(in: input, xMovement: 3, yMovement: 1),
            checkForTrees(in: input, xMovement: 5, yMovement: 1),
            checkForTrees(in: input, xMovement: 7, yMovement: 1),
            checkForTrees(in: input, xMovement: 1, yMovement: 2)
        ].reduce(1, *)
    }
    
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
