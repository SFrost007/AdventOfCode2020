//
//  Day12Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 12/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day12Tests: AoCTestCase {
    
    let example = Day12(inputURL: urlForExampleData(day: 12))
    let myInput = Day12(inputURL: urlForMyInputData(day: 12))
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 25)
        
        print("Answer for Day 12 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 12 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
