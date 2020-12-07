//
//  DayXTests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on DayX_Number/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class DayXTests: AoCTestCase {
    
    let example = DayX(inputURL: urlForExampleData(day: DayX_Number))
    let myInput = DayX(inputURL: urlForMyInputData(day: DayX_Number))
    
    func testPart1() {
        XCTAssertEqual(DayX.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day DayX_Number Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(DayX.findSomething(in: example.inputData[0]), 123)
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day DayX_Number Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
