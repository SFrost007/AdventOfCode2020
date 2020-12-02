//
//  Day2.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 02/12/2020.
//

import Foundation

class Day2 {
    
    private static func doesLineMeetPolicy1(_ line: String) -> Bool {
        let parts = line.components(separatedBy: .whitespaces)
        guard parts.count == 3 else { return false }
        
        let minMax = parts[0].components(separatedBy: "-").compactMap { Int($0) }
        let searchChar = parts[1].prefix(1)
        let password = parts[2]
        
        let trimmed = password.replacingOccurrences(of: searchChar, with: "")
        let matchedChars = password.count - trimmed.count
        return matchedChars >= minMax[0] && matchedChars <= minMax[1]
    }
    
    static func part1(input: [String]) -> Int {
        return input.filter { doesLineMeetPolicy1($0) }.count
    }
    
    private static func doesLineMeetPolicy2(_ line: String) -> Bool {
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
    
    static func part2(input: [String]) -> Int {
        return input.filter { doesLineMeetPolicy2($0) }.count
    }
    
}
