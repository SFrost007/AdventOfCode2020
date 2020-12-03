//
//  Day3Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 03/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day3Tests: AoCTestCase {
    
    let example = Day3(inputURL: urlForExampleData(day: 3))
    let myInput = Day3(inputURL: urlForMyInputData(day: 3))
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 7)
        print("Answer for Day 3 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day3.checkForTrees(in: example.inputData, xMovement: 1, yMovement: 1), 2)
        XCTAssertEqual(Day3.checkForTrees(in: example.inputData, xMovement: 3, yMovement: 1), 7)
        XCTAssertEqual(Day3.checkForTrees(in: example.inputData, xMovement: 5, yMovement: 1), 3)
        XCTAssertEqual(Day3.checkForTrees(in: example.inputData, xMovement: 7, yMovement: 1), 4)
        XCTAssertEqual(Day3.checkForTrees(in: example.inputData, xMovement: 1, yMovement: 2), 2)
        XCTAssertEqual(example.part2(), 336)
        print("Answer for Day 3 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
