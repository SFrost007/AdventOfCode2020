//
//  Day2Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 02/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day2Tests: AoCTestCase {
    
    let example = Day2(inputURL: urlForExampleData(day: 2))
    let myInput = Day2(inputURL: urlForMyInputData(day: 2))
    
    func testPart1() {
        XCTAssertTrue(Day2.doesLineMeetPolicy1("1-3 a: abcde"))
        XCTAssertFalse(Day2.doesLineMeetPolicy1("1-3 b: cdefg"))
        XCTAssertTrue(Day2.doesLineMeetPolicy1("2-9 c: ccccccccc"))
        XCTAssertEqual(example.part1(), 2)
        print("Answer for Day 2 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertTrue(Day2.doesLineMeetPolicy2("1-3 a: abcde"))
        XCTAssertFalse(Day2.doesLineMeetPolicy2("1-3 b: cdefg"))
        XCTAssertFalse(Day2.doesLineMeetPolicy2("2-9 c: ccccccccc"))
        XCTAssertEqual(example.part2(), 1)
        print("Answer for Day 2 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
