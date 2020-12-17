//
//  Day17.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 17/12/2020.
//

import Foundation

class Day17 {
    
    // MARK: - Initialisation
    
    let inputData: [[Bool]]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { $0.map { $0 == "#" } }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        fatalError("Not yet implemented")
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    static func findSomething(in input: String) -> Int {
        return -1
    }
    
}
