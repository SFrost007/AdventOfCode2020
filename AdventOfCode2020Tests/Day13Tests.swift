//
//  Day13Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 13/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day13Tests: AoCTestCase {
    
    let example = Day13(inputURL: urlForExampleData(day: 13))
    let myInput = Day13(inputURL: urlForMyInputData(day: 13))
    
    func testPart1() {
        XCTAssertEqual(example.targetTime, 939)
        XCTAssertEqual(example.busNumbers, [7,13,19,31,59])
        XCTAssertEqual(example.part1(), 295)
        XCTAssertEqual(myInput.part1(), 3789)
        
        print("Answer for Day 13 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 13 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
