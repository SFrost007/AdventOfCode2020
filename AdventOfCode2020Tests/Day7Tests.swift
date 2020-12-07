//
//  Day7Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 7/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day7Tests: AoCTestCase {
    
    let example = Day7(inputURL: urlForExampleData(day: 7))
    let myInput = Day7(inputURL: urlForMyInputData(day: 7))
    
    func testPart1() {
        XCTAssertEqual(Day7.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day 7 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day7.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 7 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
