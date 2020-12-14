//
//  Day14Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 14/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day14Tests: AoCTestCase {
    
    let example = Day14(inputURL: urlForExampleData(day: 14))
    let myInput = Day14(inputURL: urlForMyInputData(day: 14))
    
    func testPart1() {
        XCTAssertEqual(Day14.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day 14 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day14.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 14 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
