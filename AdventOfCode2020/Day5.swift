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
        return -1
    }
    
    // MARK: - Helper struct

    struct SeatLocation: Equatable {
        let row: Int
        let column: Int
    }
    
    // MARK: - Worker functions
    
    static func findSeatLocation(_ input: String) -> SeatLocation {
        return SeatLocation(row: 0, column: 0)
    }
    
    static func getSeatID(_ location: SeatLocation) -> Int {
        return location.row * 8 + location.column
    }
}
