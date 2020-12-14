//
//  Day14Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 14/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day14Tests: AoCTestCase {
    
    let myInput = Day14(inputURL: urlForMyInputData(day: 14))
    
    func testHelperMethods() {
        let memory: [UInt64: UInt64] = [1: 23, 2: 57, 5: 10]
        XCTAssertEqual(Day14.getTotalMemoryValue(memory: memory), 90)
        
        let maskInstr = "mask = 01111X0011X11110XX11X110111001X00001"
        XCTAssertEqual(Day14.getMaskFromInstruction(maskInstr), "01111X0011X11110XX11X110111001X00001")
        
        let memInstr = "mem[8] = 11"
        let (addr, value) = Day14.getAddressAndValue(memInstr)
        XCTAssertEqual(addr, 8)
        XCTAssertEqual(value, 11)
        
        let testMask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X"
        XCTAssertEqual(Day14.applyMaskToValue(mask: testMask, value: 11), 73)
        XCTAssertEqual(Day14.applyMaskToValue(mask: testMask, value: 101), 101)
        XCTAssertEqual(Day14.applyMaskToValue(mask: testMask, value: 0), 64)
    }
    
    func testPart1() {
        let example = Day14(inputURL: AoCTestCase.urlForExampleData(day: 14))
        XCTAssertEqual(example.part1(), 165)
        XCTAssertEqual(myInput.part1(), 13496669152158)
        
        print("Answer for Day 14 Part 1: \(myInput.part1())")
        measure {
            let _ = myInput.part1()
        }
    }
    
    func testPart2() {
        let example = Day14(inputURL: AoCTestCase.urlForExampleData(day: 14, part: 2))
        XCTAssertEqual(example.part2(), 208)
        
        print("Answer for Day 14 Part 2: \(myInput.part2())")
        measure {
            let _ = myInput.part2()
        }
    }

}
