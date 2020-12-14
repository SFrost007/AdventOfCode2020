//
//  Day14.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 14/12/2020.
//

import Foundation

class Day14 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).filter { !$0.isEmpty }
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
