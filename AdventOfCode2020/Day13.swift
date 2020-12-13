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
    let busNumbers: [Int] // Used for part 1, sorted
    let busSequence: [Int] // Used for part 2, includes 'x' as 0
    
    init(inputURL: URL) {
        let lines = try! String(contentsOf: inputURL).components(separatedBy: .newlines)
        targetTime = Int(lines[0])!
        busNumbers = lines[1].components(separatedBy: ",").compactMap { Int($0) }.sorted()
        busSequence = lines[1].components(separatedBy: ",").compactMap { Int($0) ?? 0 }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        var earliestTimes: [Int: Int] = [:]
        for bus in busNumbers {
            var repeatTime = 0
            while repeatTime < targetTime {
                repeatTime += bus
            }
            earliestTimes[bus] = repeatTime
        }
        let earliestTime = earliestTimes.map { $0.value }.sorted().first!
        let busNumber = earliestTimes.first { $0.value == earliestTime }!.key
        let waitingTime = earliestTime - targetTime
        return busNumber * waitingTime
    }
    
    func part2() -> Int {
        // Find the earliest times each individual bus arrives by its offset after a multiple of the first bus
        let firstBusNumber = busSequence.first!
        var earliestRepeats = [firstBusNumber: 1]
        for (index, busNumber) in busSequence.enumerated() {
            guard busNumber != 0 && busNumber != firstBusNumber else { continue }
            var multiple = 1
            while ((multiple * firstBusNumber) + index) % busNumber != 0 {
                multiple += 1
            }
            print("Found correct multiple for bus \(busNumber) at \(index): \(multiple)")
            earliestRepeats[busNumber] = multiple
        }
        // Now find the lowest common multiple of all the multipliers, i.e. the first time they align
        let multipliers = earliestRepeats.map { $0.value }
        print("Multipliers: \(multipliers)")
        return Self.findLowestCommonMultiple(multipliers)
    }
    
    // MARK: - Worker functions
    
    // Note: I Googled this part of the solution to get the LCM algorithm
    static func findLowestCommonMultiple(_ input: [Int]) -> Int {
        guard input.count > 1 else { return input[0] }
        return lcm(input[0], findLowestCommonMultiple(Array(input[1...])))
    }
    
    // From https://gist.github.com/aniltv06/6f3e9c6208e27a89259919eeb3c3d703
    private static func gcd(_ x: Int, _ y: Int) -> Int {
        var a = 0
        var b = max(x, y)
        var r = min(x, y)
        
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }

    private static func lcm(_ x: Int, _ y: Int) -> Int {
        return x / gcd(x, y) * y
    }
    
}
