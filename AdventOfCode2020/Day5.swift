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
    
    static func findSeatLocation(_ input: String) -> SeatLocation {
        var rowRange = 0...127
        for char in input.prefix(7) {
            let split = ((rowRange.upperBound - rowRange.lowerBound) / 2) + 1
            switch char {
            case "F": rowRange = rowRange.lowerBound...(rowRange.upperBound - split)
            case "B": rowRange = (rowRange.lowerBound + split)...rowRange.upperBound
            default: fatalError()
            }
        }
        
        var columnRange = 0...7
        for char in input.suffix(3) {
            let split = ((columnRange.upperBound - columnRange.lowerBound) / 2) + 1
            switch char {
            case "L": columnRange = columnRange.lowerBound...(columnRange.upperBound - split)
            case "R": columnRange = (columnRange.lowerBound + split)...columnRange.upperBound
            default: fatalError()
            }
        }
        
        return SeatLocation(row: rowRange.lowerBound, column: columnRange.lowerBound)
    }
    
    static func getSeatID(_ location: SeatLocation) -> Int {
        return location.row * 8 + location.column
    }
}
