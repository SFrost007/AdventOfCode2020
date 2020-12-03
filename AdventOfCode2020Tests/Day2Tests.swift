//
//  Day2Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 02/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day2Tests: AoCTestCase {
    
    lazy var exampleInput: [String] = {
        return Day2.parseInput(from: urlForExampleInput())
    }()
    
    lazy var myInput: [String] = {
        return Day2.parseInput(from: urlForMyInput())
    }()
    
    func testPart1() {
        XCTAssertTrue(Day2.doesLineMeetPolicy1("1-3 a: abcde"))
        XCTAssertFalse(Day2.doesLineMeetPolicy1("1-3 b: cdefg"))
        XCTAssertTrue(Day2.doesLineMeetPolicy1("2-9 c: ccccccccc"))
        XCTAssertEqual(Day2.part1(input: exampleInput), 2)
        print("*****\nPart 1: \(Day2.part1(input: myInput))\n*****")
        measure {
            let _ = Day2.part1(input: myInput)
        }
    }
    
    func testPart2() {
        XCTAssertTrue(Day2.doesLineMeetPolicy2("1-3 a: abcde"))
        XCTAssertFalse(Day2.doesLineMeetPolicy2("1-3 b: cdefg"))
        XCTAssertFalse(Day2.doesLineMeetPolicy2("2-9 c: ccccccccc"))
        XCTAssertEqual(Day2.part2(input: exampleInput), 1)
        print("*****\nPart 2: \(Day2.part2(input: myInput))\n*****")
        measure {
            let _ = Day2.part2(input: myInput)
        }
    }

}
