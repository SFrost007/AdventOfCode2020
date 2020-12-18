//
//  Day18Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 18/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day18Tests: AoCTestCase {
    
    let myInput = Day18(inputURL: urlForMyInputData(day: 18))
    
    func testPart1() {
        // My simple test (no brackets)
        XCTAssertEqual(Day18.calculateResult(equation: "1 + 2 * 3"), 9)
        // Example cases
        XCTAssertEqual(Day18.calculateResult(equation: "1 + (2 * 3) + (4 * (5 + 6))"), 51)
        XCTAssertEqual(Day18.calculateResult(equation: "2 * 3 + (4 * 5)"), 26)
        XCTAssertEqual(Day18.calculateResult(equation: "5 + (8 * 3 + 9 + 3 * 4 * 3)"), 437)
        XCTAssertEqual(Day18.calculateResult(equation: "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"), 12240)
        XCTAssertEqual(Day18.calculateResult(equation: "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"), 13632)
        
        print("Answer for Day 18 Part 1: \(myInput.part1())")
        measure {
            XCTAssertEqual(myInput.part1(), 701339185745)
        }
    }
    
    func testPart2() {
        // My simple test (no brackets)
        XCTAssertEqual(Day18.calculateResult(equation: "1 + 4 * 3", plusHasPrecendence: true), 15)
        // Example cases
        XCTAssertEqual(Day18.calculateResult(equation: "1 + (2 * 3) + (4 * (5 + 6))", plusHasPrecendence: true), 51)
        XCTAssertEqual(Day18.calculateResult(equation: "2 * 3 + (4 * 5)", plusHasPrecendence: true), 46)
        XCTAssertEqual(Day18.calculateResult(equation: "5 + (8 * 3 + 9 + 3 * 4 * 3)", plusHasPrecendence: true), 1445)
        XCTAssertEqual(Day18.calculateResult(equation: "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))", plusHasPrecendence: true), 669060)
        XCTAssertEqual(Day18.calculateResult(equation: "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2", plusHasPrecendence: true), 23340)

        print("Answer for Day 18 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
