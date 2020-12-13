//
//  Day13.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 13/12/2020.
//

import Foundation

class Day13 {
    
    // MARK: - Initialisation
    
    let targetTime: Int
    let busNumbers: [Int]
    
    init(inputURL: URL) {
        let lines = try! String(contentsOf: inputURL).components(separatedBy: .newlines)
        targetTime = Int(lines[0])!
        busNumbers = lines[1].components(separatedBy: ",").compactMap { Int($0) }.sorted()
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
