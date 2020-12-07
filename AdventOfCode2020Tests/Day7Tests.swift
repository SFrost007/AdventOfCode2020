//
//  Day7Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 7/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day7Tests: AoCTestCase {
    
    let example = Day7(inputURL: urlForExampleData(day: 7))
    let myInput = Day7(inputURL: urlForMyInputData(day: 7))
    
    func testParsing() {
        XCTAssertEqual(example.inputData.count, 9)
        let inner1 = Day7.ContainedBag(color: "bright white", count: 1)
        let inner2 = Day7.ContainedBag(color: "muted yellow", count: 2)
        let outer = Day7.Instruction(containerBagColor: "light red", innerBags: [inner1, inner2])
        XCTAssertEqual(example.inputData[0], outer)
    }
    
    func testPart1() {
        XCTAssertEqual(Day7.findAllowedOuterBags(for: ["shiny gold"], in: example.inputData),
                       ["bright white", "muted yellow", "dark orange", "light red"])
        XCTAssertEqual(example.part1(), 4)
        
        print("Answer for Day 7 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 7 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
