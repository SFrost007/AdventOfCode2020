//
//  Day5Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 05/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day5Tests: AoCTestCase {
    
    let myInput = Day5(inputURL: urlForMyInputData(day: 5))
    
    func testPart1() {
        XCTAssertEqual(Day5.findSeatLocation("FBFBBFFRLR"), Day5.SeatLocation(row: 44, column: 5))
        XCTAssertEqual(Day5.getSeatID(Day5.SeatLocation(row: 44, column: 5)), 357)
        
        XCTAssertEqual(Day5.findSeatLocation("BFFFBBFRRR"), Day5.SeatLocation(row: 70, column: 7))
        XCTAssertEqual(Day5.getSeatID(Day5.SeatLocation(row: 70, column: 7)), 567)
        
        XCTAssertEqual(Day5.findSeatLocation("FFFBBBFRRR"), Day5.SeatLocation(row: 14, column: 7))
        XCTAssertEqual(Day5.getSeatID(Day5.SeatLocation(row: 14, column: 7)), 119)
        
        XCTAssertEqual(Day5.findSeatLocation("BBFFBBFRLL"), Day5.SeatLocation(row: 102, column: 4))
        XCTAssertEqual(Day5.getSeatID(Day5.SeatLocation(row: 102, column: 4)), 820)
        
        print("Answer for Day 5 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        print("Answer for Day 5 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}

