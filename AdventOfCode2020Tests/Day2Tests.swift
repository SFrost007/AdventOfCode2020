//
//  Day2Tests.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 02/12/2020.
//

import XCTest
@testable import AdventOfCode2020

class Day2Tests: XCTestCase {
    
    lazy var inputLines: [String] = {
        let testBundle = Bundle(for: type(of: self))
        let inputURL = testBundle.url(forResource: "Day2", withExtension: "txt")!
        return try! String(contentsOf: inputURL).components(separatedBy: .newlines)
    }()
    
    func testPart1() {
        XCTAssertEqual(Day2.part1(input: inputLines), 414)
        measure {
            let _ = Day2.part1(input: inputLines)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Day2.part2(input: inputLines), 413)
        measure {
            let _ = Day2.part2(input: inputLines)
        }
    }

}
