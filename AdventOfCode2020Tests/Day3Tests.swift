//
//  Day3Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 03/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day3Tests: AoCTestCase {
    
    lazy var exampleInput: [[Bool]] = {
        return Day3.parseInput(from: urlForExampleInput())
    }()
    
    lazy var myInput: [[Bool]] = {
        return Day3.parseInput(from: urlForMyInput())
    }()
    
    func testPart1() {
        XCTAssertEqual(Day3.checkForTrees(in: exampleInput, xMovement: 3, yMovement: 1), 7)
        print("*****\nPart 1: \(Day3.part1(input: myInput))\n*****")
        measure {
            let _ = Day3.part1(input: myInput)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day3.checkForTrees(in: exampleInput, xMovement: 1, yMovement: 1), 2)
        XCTAssertEqual(Day3.checkForTrees(in: exampleInput, xMovement: 3, yMovement: 1), 7)
        XCTAssertEqual(Day3.checkForTrees(in: exampleInput, xMovement: 5, yMovement: 1), 3)
        XCTAssertEqual(Day3.checkForTrees(in: exampleInput, xMovement: 7, yMovement: 1), 4)
        XCTAssertEqual(Day3.checkForTrees(in: exampleInput, xMovement: 1, yMovement: 2), 2)
        print("*****\nPart 2: \(Day3.part2(input: myInput))\n*****")
        measure {
            let _ = Day3.part2(input: myInput)
        }
    }

}
