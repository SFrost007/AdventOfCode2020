//
//  Day6Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 06/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day6Tests: AoCTestCase {
    
    let example = Day6(inputURL: urlForExampleData(day: 6))
    let myInput = Day6(inputURL: urlForMyInputData(day: 6))
    
    func testPart1() {
        XCTAssertEqual(Day6.uniqueAnswers(in: example.inputData[0]), 3)
        XCTAssertEqual(Day6.uniqueAnswers(in: example.inputData[1]), 3)
        XCTAssertEqual(Day6.uniqueAnswers(in: example.inputData[2]), 3)
        XCTAssertEqual(Day6.uniqueAnswers(in: example.inputData[3]), 1)
        XCTAssertEqual(Day6.uniqueAnswers(in: example.inputData[4]), 1)
        XCTAssertEqual(example.part1(), 11)
        
        print("Answer for Day 5 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day6.answeredByAll(in: example.inputData[0]), 3)
        XCTAssertEqual(Day6.answeredByAll(in: example.inputData[1]), 0)
        XCTAssertEqual(Day6.answeredByAll(in: example.inputData[2]), 1)
        XCTAssertEqual(Day6.answeredByAll(in: example.inputData[3]), 1)
        XCTAssertEqual(Day6.answeredByAll(in: example.inputData[4]), 1)
        XCTAssertEqual(example.part2(), 6)
        
        print("Answer for Day 5 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
