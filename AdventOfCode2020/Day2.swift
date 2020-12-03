//
//  Day2.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 02/12/2020.
//

import Foundation

class Day2 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines)
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return inputData.filter { Self.doesLineMeetPolicy1($0) }.count
    }
    
    func part2() -> Int {
        return inputData.filter { Self.doesLineMeetPolicy2($0) }.count
    }
    
    // MARK: - Worker functions
    
    static func doesLineMeetPolicy1(_ line: String) -> Bool {
        let parts = line.components(separatedBy: .whitespaces)
        guard parts.count == 3 else { return false }
        
        let minMax = parts[0].components(separatedBy: "-").compactMap { Int($0) }
        let searchChar = parts[1].prefix(1)
        let password = parts[2]
        
        let trimmed = password.replacingOccurrences(of: searchChar, with: "")
        let matchedChars = password.count - trimmed.count
        return matchedChars >= minMax[0] && matchedChars <= minMax[1]
    }
    
    static func doesLineMeetPolicy2(_ line: String) -> Bool {
        let parts = line.components(separatedBy: .whitespaces)
        guard parts.count == 3 else { return false }
        
        let checkIndices = parts[0].components(separatedBy: "-").compactMap { Int($0) }
        let searchChar = parts[1].prefix(1)
        let password = parts[2]
        
        let firstMatch = password.prefix(checkIndices[0]).suffix(1) == searchChar
        let secondMatch = password.prefix(checkIndices[1]).suffix(1) == searchChar
        // XOR
        return firstMatch != secondMatch && (firstMatch || secondMatch)
    }
    
}
