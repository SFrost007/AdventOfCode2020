//
//  Day1Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 02/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day1Tests: AoCTestCase {
    
    lazy var exampleInput: [Int] = {
        return Day1.parseInput(from: urlForExampleInput())
    }()
    
    lazy var myInput: [Int] = {
        return Day1.parseInput(from: urlForMyInput())
    }()
    
    func testPart1() {
        XCTAssertEqual(Day1.part1(input: exampleInput), 514579)
        print("*****\nPart 1: \(Day1.part1(input: myInput))\n*****")
        measure {
            let _ = Day1.part1(input: myInput)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day1.part2(input: exampleInput), 241861950)
        print("*****\nPart 2: \(Day1.part2(input: myInput))\n*****")
        measure {
            let _ = Day1.part2(input: myInput)
        }
    }

}
