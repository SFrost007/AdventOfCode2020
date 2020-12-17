//
//  Day17Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 17/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day17Tests: AoCTestCase {
    
    let example = Day17(inputURL: urlForExampleData(day: 17))
    let myInput = Day17(inputURL: urlForMyInputData(day: 17))
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 112)
        
        print("Answer for Day 17 Part 1: \(myInput.part1())")
        measure {
            XCTAssertEqual(myInput.part1(), 263)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 848)
        
        print("Answer for Day 17 Part 2: \(myInput.part2())")
        measure {
            XCTAssertEqual(myInput.part2(), 1680)
        }
    }

}
