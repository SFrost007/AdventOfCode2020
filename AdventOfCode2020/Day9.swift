//
//  Day9.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 9/12/2020.
//

import Foundation

class Day9 {
    
    // MARK: - Initialisation
    
    let inputData: [Int]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).compactMap { Int($0) }
    }
    
    // MARK: - Problem cases
    
    func part1(preamble: Int) -> Int {
        return Self.findFirstInvalid(in: inputData, preamble: preamble)
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    static func findFirstInvalid(in input: [Int], preamble: Int) -> Int {
        fatalError("Not yet implemented")
    }
    
}
