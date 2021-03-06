//
//  Day10Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 10/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day10Tests: AoCTestCase {
    
    let example = Day10(inputURL: urlForExampleData(day: 10))
    let myInput = Day10(inputURL: urlForMyInputData(day: 10))
    
    func testPart1() {
        let exampleJumps = Day10.findJoltageJumps(in: example.inputData)
        XCTAssertEqual(exampleJumps.0, 22)
        XCTAssertEqual(exampleJumps.2, 10)
        XCTAssertEqual(example.part1(), 220)
        
        print("Answer for Day 10 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        // "Part0" is the simple example data
        let simpleExample = Day10(inputURL: AoCTestCase.urlForExampleData(day: 10, part: 0))
        XCTAssertEqual(simpleExample.part2(), 8)
        XCTAssertEqual(example.part2(), 19208)

        XCTAssertEqual(myInput.part2(), 12089663946752)
        print("Answer for Day 10 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
