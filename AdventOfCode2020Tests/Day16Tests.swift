//
//  Day16Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 16/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day16Tests: AoCTestCase {
    
    let example = Day16(inputURL: urlForExampleData(day: 16))
    let myInput = Day16(inputURL: urlForMyInputData(day: 16))

    func testParsing() {
        XCTAssertEqual(example.fields.count, 3)
        XCTAssertEqual(example.fields.first?.fieldName, "class")
        XCTAssertEqual(example.fields.first?.validRanges.count, 2)
        XCTAssertEqual(example.fields.first?.validRanges.first?.min(), 1)
        XCTAssertEqual(example.fields.first?.validRanges.first?.max(), 3)

        XCTAssertEqual(example.myTicket, [7,1,14])

        XCTAssertEqual(example.nearbyTickets.count, 4)
        XCTAssertEqual(example.nearbyTickets.first, [7,3,47])
        XCTAssertEqual(example.nearbyTickets.last, [38,6,12])
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 123)
        
        print("Answer for Day 16 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 123)
        
        print("Answer for Day 16 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
