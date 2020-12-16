//
//  Day16Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 16/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day16Tests: AoCTestCase {
    
    let example = Day16(inputURL: urlForExampleData(day: 16))
    let myInput = Day16(inputURL: urlForMyInputData(day: 16))
    
    func testPart1() {
        XCTAssertEqual(Day16.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day 16 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day16.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 16 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
