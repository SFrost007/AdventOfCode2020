//
//  Day10.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 10/12/2020.
//

import Foundation

class Day10 {
    
    // MARK: - Initialisation
    
    let inputData: [Int]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).compactMap { Int($0) }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        let joltageJumps = Self.findJoltageJumps(in: inputData)
        return joltageJumps.0 * joltageJumps.2
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    static func findJoltageJumps(in input: [Int]) -> (Int, Int, Int) {
        fatalError("Not yet implemented")
    }
    
}
