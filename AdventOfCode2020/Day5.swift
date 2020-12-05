//
//  Day5.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 05/12/2020.
//

import Foundation

class Day5 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).filter { !$0.isEmpty }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return inputData
            .map { Self.findSeatLocation($0) }
            .map { Self.getSeatID($0) }
            .reduce(0, max)
    }
    
    func part2() -> Int {
        let boardingPasses = inputData
            .map { Self.findSeatLocation($0) }
            .map { Self.getSeatID($0) }
            .sorted()
        
        for (index, seatID) in boardingPasses.enumerated() {
            guard index > 0 else { continue }
            if boardingPasses[index - 1] != seatID - 1 {
                return seatID - 1
            }
        }
        return -1
    }
    
    // MARK: - Helper struct

    struct SeatLocation: Equatable {
        let row: Int
        let column: Int
    }
    
    // MARK: - Worker functions
    
    private static func getLocation(input: String, lowerChar: Character, upperChar: Character, range: ClosedRange<Int>) -> Int {
        var newRange = range
        for char in input {
            let split = (newRange.upperBound + 1 - newRange.lowerBound) / 2
            switch char {
            case lowerChar: newRange = newRange.lowerBound...(newRange.upperBound - split)
            case upperChar: newRange = (newRange.lowerBound + split)...newRange.upperBound
            default: fatalError("Invalid character in input: \(char)")
            }
        }
        assert(newRange.lowerBound == newRange.upperBound)
        return newRange.lowerBound
    }
    
    static func findSeatLocation(_ input: String) -> SeatLocation {
        return SeatLocation(
            row: getLocation(input: String(input.prefix(7)), lowerChar: "F", upperChar: "B", range: 0...127),
            column: getLocation(input: String(input.suffix(3)), lowerChar: "L", upperChar: "R", range: 0...7)
        )
    }
    
    static func getSeatID(_ location: SeatLocation) -> Int {
        return location.row * 8 + location.column
    }
}
