//
//  Day1Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 02/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day1Tests: AoCTestCase {
    
    let example = Day1(inputURL: urlForExampleData(day: 1))
    let myInput = Day1(inputURL: urlForMyInputData(day: 1))
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 514579)
        print("Answer for Day 1 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 241861950)
        print("Answer for Day 1 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
