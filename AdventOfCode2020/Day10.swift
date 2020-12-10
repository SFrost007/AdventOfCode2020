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
        return Self.findArrangements(in: inputData.sorted())
    }
    
    // MARK: - Worker functions
    
    static func findJoltageJumps(in input: [Int]) -> (Int, Int, Int) {
        let sorted = input.sorted()
        let jumps = [sorted[0]] + sorted[1...].enumerated().map { previousIndex, item in item - sorted[previousIndex] }
        // Final tuple item is initialised as 1 because device's built-in jump (not included in input) is 3
        return jumps.reduce(into: (0, 0, 1)) { (tuple, value) in
            switch value {
            case 1: tuple.0 += 1
            case 2: tuple.1 += 1
            case 3: tuple.2 += 1
            default: fatalError("Invalid joltage jump")
            }
        }
    }

    // Requires input array to be pre-sorted and conformant to the rules (i.e. no gaps greater than 3)
    private static func findArrangements(in input: [Int]) -> Int {
        var permutationsUptoIndex = [0: 1]
        for value in input {
            permutationsUptoIndex[value] = (1...3).compactMap { permutationsUptoIndex[value - $0] }.reduce(0, +)
        }
        return permutationsUptoIndex[input.last!]!
    }
    
}
