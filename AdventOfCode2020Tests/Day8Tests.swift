//
//  Day8Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 8/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day8Tests: AoCTestCase {
    
    let example = Day8(inputURL: urlForExampleData(day: 8))
    let myInput = Day8(inputURL: urlForMyInputData(day: 8))
    
    func testPart1() {
        XCTAssertEqual(Day8.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day 8 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day8.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 8 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
