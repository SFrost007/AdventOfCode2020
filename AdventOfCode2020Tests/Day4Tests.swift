//
//  Day4Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 04/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day4Tests: AoCTestCase {
    
    let myInput = Day4(inputURL: urlForMyInputData(day: 4))
    
    func testPart1() {
        let example = Day4(inputURL: AoCTestCase.urlForExampleData(day: 4))
        XCTAssertTrue(Day4.isPassportStringValid(example.inputData[0], checkValues: false))
        XCTAssertFalse(Day4.isPassportStringValid(example.inputData[1], checkValues: false))
        XCTAssertTrue(Day4.isPassportStringValid(example.inputData[2], checkValues: false))
        XCTAssertFalse(Day4.isPassportStringValid(example.inputData[3], checkValues: false))
        XCTAssertEqual(example.part1(), 2)
        print("Answer for Day 4 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        let example = Day4(inputURL: AoCTestCase.urlForExampleData(day: 4, part: 2))
        XCTAssertFalse(Day4.isPassportStringValid(example.inputData[0], checkValues: true))
        XCTAssertFalse(Day4.isPassportStringValid(example.inputData[1], checkValues: true))
        XCTAssertFalse(Day4.isPassportStringValid(example.inputData[2], checkValues: true))
        XCTAssertFalse(Day4.isPassportStringValid(example.inputData[3], checkValues: true))
        XCTAssertTrue(Day4.isPassportStringValid(example.inputData[4], checkValues: true))
        XCTAssertTrue(Day4.isPassportStringValid(example.inputData[5], checkValues: true))
        XCTAssertTrue(Day4.isPassportStringValid(example.inputData[6], checkValues: true))
        XCTAssertTrue(Day4.isPassportStringValid(example.inputData[7], checkValues: true))
        XCTAssertEqual(example.part2(), 4)
        print("Answer for Day 4 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
