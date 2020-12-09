//
//  Day9Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 9/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day9Tests: AoCTestCase {
    
    let example = Day9(inputURL: urlForExampleData(day: 9))
    let myInput = Day9(inputURL: urlForMyInputData(day: 9))
    
    func testPart1() {
        XCTAssertEqual(example.part1(preamble: 5), 127)
        
        print("Answer for Day 9 Part 1: \(myInput.part1(preamble: 25))")
        measure {
            let _ = myInput.part1(preamble: 25)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 9 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
