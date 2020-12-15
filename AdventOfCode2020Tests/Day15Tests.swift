//
//  Day15Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 15/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day15Tests: AoCTestCase {

    // The input format seems simple enough (small list of ints) to not be worth data file parsing
    let myInput = [1,20,11,6,12,0]
    
    func testPart1() {
        // Test data
        XCTAssertEqual(Day15.getAnswer(input: [0,3,6], iterations: 2020), 436)
        XCTAssertEqual(Day15.getAnswer(input: [1,3,2], iterations: 2020), 1)
        XCTAssertEqual(Day15.getAnswer(input: [2,1,3], iterations: 2020), 10)
        XCTAssertEqual(Day15.getAnswer(input: [1,2,3], iterations: 2020), 27)
        XCTAssertEqual(Day15.getAnswer(input: [2,3,1], iterations: 2020), 78)
        XCTAssertEqual(Day15.getAnswer(input: [3,2,1], iterations: 2020), 438)
        XCTAssertEqual(Day15.getAnswer(input: [3,1,2], iterations: 2020), 1836)
        
        print("Answer for Day 15 Part 1: \(Day15.getAnswer(input: myInput, iterations: 2020))")
        measure {
            let _ = Day15.getAnswer(input: myInput, iterations: 2020)
        }
    }

    // Oddly simple, this isn't fast but gets the correct answer just by parameterising a constant
    func testPart2() {
        // Test data
        XCTAssertEqual(Day15.getAnswer(input: [0,3,6], iterations: 30000000), 175594)
        XCTAssertEqual(Day15.getAnswer(input: [1,3,2], iterations: 30000000), 2578)
        XCTAssertEqual(Day15.getAnswer(input: [2,1,3], iterations: 30000000), 3544142)
        XCTAssertEqual(Day15.getAnswer(input: [1,2,3], iterations: 30000000), 261214)
        XCTAssertEqual(Day15.getAnswer(input: [2,3,1], iterations: 30000000), 6895259)
        XCTAssertEqual(Day15.getAnswer(input: [3,2,1], iterations: 30000000), 18)
        XCTAssertEqual(Day15.getAnswer(input: [3,1,2], iterations: 30000000), 362)

        print("Answer for Day 15 Part 2: \(Day15.getAnswer(input: myInput, iterations: 30000000))")
        measure {
            let _ = Day15.getAnswer(input: myInput, iterations: 30000000)
        }
    }

}
