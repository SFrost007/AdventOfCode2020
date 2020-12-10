//
//  Day10Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 10/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day10Tests: AoCTestCase {
    
    let example = Day10(inputURL: urlForExampleData(day: 10))
    let myInput = Day10(inputURL: urlForMyInputData(day: 10))
    
    func testPart1() {
        XCTAssertEqual(Day10.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day 10 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day10.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 10 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
