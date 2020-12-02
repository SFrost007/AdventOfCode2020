//
//  Day1Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 02/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day1Tests: XCTestCase {
    
    lazy var intArray: [Int] = {
        let testBundle = Bundle(for: type(of: self))
        let inputURL = testBundle.url(forResource: "Day1", withExtension: "txt")!
        return try! String(contentsOf: inputURL).components(separatedBy: .newlines).compactMap { Int($0) }
    }()
    
    func testPart1() {
        XCTAssertEqual(Day1.part1(input: intArray), 252724)
        measure {
            let _ = Day1.part1(input: intArray)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day1.part2(input: intArray), 276912720)
        measure {
            let _ = Day1.part2(input: intArray)
        }
    }

}
