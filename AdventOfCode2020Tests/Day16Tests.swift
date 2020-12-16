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
    let example2 = Day16(inputURL: urlForExampleData(day: 16, part: 2))
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

    func testHelperFunctions() {
        XCTAssertEqual(example.allFieldRanges.count, 6)
        XCTAssertEqual(example.validTickets.count, 2)
        XCTAssertTrue(example.validTickets.contains(example.myTicket))
        XCTAssertEqual(Day16.ticketValuesGroupedByField(validTickets: example2.validTickets),
                       [[3,15,5,11],[9,1,14,12],[18,5,9,13]])
        XCTAssertTrue(example2.fields[0].isValueValid(0))
        XCTAssertTrue(example2.fields[0].isValueValid(1))
        XCTAssertFalse(example2.fields[0].isValueValid(2))
        XCTAssertFalse(example2.fields[0].isValueValid(3))
        XCTAssertTrue(example2.fields[0].isValueValid(4))
        XCTAssertTrue(example2.fields[0].isValueValid(19))
        XCTAssertFalse(example2.fields[0].isValueValid(20))
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 71)
        
        print("Answer for Day 16 Part 1: \(myInput.part1())")
        measure {
            XCTAssertEqual(myInput.part1(), 32842)
        }
    }
    
    func testPart2() {
        let classField = example2.fields[0]
        let rowField = example2.fields[1]
        let seatField = example2.fields[2]
        let fieldMapping = Day16.findFieldIndexes(validTickets: example2.validTickets, fields: example2.fields)
        XCTAssertEqual(fieldMapping[rowField], 0)
        XCTAssertEqual(fieldMapping[classField], 1)
        XCTAssertEqual(fieldMapping[seatField], 2)
        
        print("Answer for Day 16 Part 2: \(myInput.part2())")
        measure {
            XCTAssertEqual(myInput.part2(), 2628667251989)
        }
    }

}
