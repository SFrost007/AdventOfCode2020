//
//  Day11Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 11/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day11Tests: AoCTestCase {
    
    let example = Day11(inputURL: urlForExampleData(day: 11))
    let myInput = Day11(inputURL: urlForMyInputData(day: 11))
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 37)
        XCTAssertEqual(myInput.part1(), 2483)
        
        print("Answer for Day 11 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 11 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
