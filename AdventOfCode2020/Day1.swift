//
//  Day1.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 02/12/2020.
//

import Foundation

class Day1 {
    
    static func part1(input: [Int]) -> Int {
        let sortedArray = input.sorted()
        for (i, value1) in sortedArray.enumerated() {
            for value2 in sortedArray[i...].reversed() {
                let sum = value1 + value2
                if sum == 2020 {
                    return value1 * value2
                } else if sum < 2020 {
                    break
                }
            }
        }
        fatalError("No result found")
    }
    
    static func part2(input: [Int]) -> Int {
        let sortedArray = input.sorted()
        for (i, value1) in sortedArray.enumerated() {
            for (j, value2) in sortedArray[i...].reversed().enumerated() {
                if value1 + value2 > 2020 { continue }
                for (k, value3) in sortedArray[i...].enumerated() {
                    if j == k { continue }
                    let sum = value1 + value2 + value3
                    if sum == 2020 {
                        return value1 * value2 * value3
                    } else if sum > 2020 {
                        break
                    }
                }
            }
        }
        fatalError("No result found")
    }
    
}
