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
    
    func part2(preamble: Int) -> Int {
        let invalidNumber = Self.findFirstInvalid(in: inputData, preamble: preamble)
        let range = Self.findContiguousRange(in: inputData, summingTo: invalidNumber)
        let subarray = inputData[range]
        return subarray.min()! + subarray.max()!
    }
    
    // MARK: - Worker functions
    
    static func findFirstInvalid(in input: [Int], preamble: Int) -> Int {
        guard input.count > preamble else { fatalError("Input too short") }
        for i in preamble..<input.count {
            let lastXItems = input[i-preamble..<i]
            let thisValue = input[i]
            guard thisValue > lastXItems.min()! * 2 else { return thisValue }
            guard thisValue < lastXItems.max()! * 2 else { return thisValue }
            if !sumComponentsExist(in: Array(lastXItems), total: thisValue) {
                return thisValue
            }
        }
        fatalError("No result found")
    }
    
    private static func sumComponentsExist(in array: [Int], total: Int) -> Bool {
        for i in 0..<array.count {
            for j in i+1..<array.count {
                if array[i] + array[j] == total {
                    return true
                }
            }
        }
        return false
    }
    
    static func findContiguousRange(in input: [Int], summingTo: Int) -> Range<Int> {
        for i in 0..<input.count {
            for j in i+1..<input.count {
                let sum = input[i...j].reduce(0, +)
                if sum == summingTo { return Range(i...j) }
                if sum > summingTo { break }
            }
        }
        fatalError("No result found")
    }
    
}
