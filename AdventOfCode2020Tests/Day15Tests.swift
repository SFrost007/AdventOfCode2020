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
        XCTAssertEqual(Day15.part1(input: [0,3,6]), 436)
        XCTAssertEqual(Day15.part1(input: [1,3,2]), 1)
        XCTAssertEqual(Day15.part1(input: [2,1,3]), 10)
        XCTAssertEqual(Day15.part1(input: [1,2,3]), 27)
        XCTAssertEqual(Day15.part1(input: [2,3,1]), 78)
        XCTAssertEqual(Day15.part1(input: [3,2,1]), 438)
        XCTAssertEqual(Day15.part1(input: [3,1,2]), 1836)
        
        print("Answer for Day 15 Part 1: \(Day15.part1(input: myInput))")
        measure {
            let _ = Day15.part1(input: myInput)
        }
    }
    
//    func testPart2() {
//        XCTAssertEqual(Day15.findSomething(in: example.inputData[0]), 123)
//        XCTAssertEqual(example.part2(), 123)
//        
//        print("Answer for Day 15 Part 2: \(myInput.part2())")
//        measure {
//            let _ = myInput.part2()
//        }
//    }

}
