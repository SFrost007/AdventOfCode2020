import Foundation
import XCTest

// Simple input parsing with no error handling
let inputURL = Bundle.main.url(forResource: "Input", withExtension: "txt")!
let intArray = try! String(contentsOf: inputURL).components(separatedBy: .newlines).compactMap { Int($0) }

class Day1: XCTestCase {
    
    static func part1(input: [Int]) -> Int {
        let sortedArray = input.sorted()
        for (i, value1) in sortedArray.enumerated() {
            for value2 in sortedArray[i...].reversed() {
                let sum = value1 + value2
                if sum == 2020 {
                    return value1 * value2
                } else if sum < 2020 {
                    break
                }
            }
        }
        fatalError("No result found")
    }
    
    static func part2(input: [Int]) -> Int {
        let sortedArray = input.sorted()
        for (i, value1) in sortedArray.enumerated() {
            for (j, value2) in sortedArray[i...].reversed().enumerated() {
                if value1 + value2 > 2020 { continue }
                for (k, value3) in sortedArray[i...].enumerated() {
                    if j == k { continue }
                    let sum = value1 + value2 + value3
                    if sum == 2020 {
                        return value1 * value2 * value3
                    } else if sum > 2020 {
                        break
                    }
                }
            }
        }
        fatalError("No result found")
    }
    
    func testPart1() {
        XCTAssertEqual(Self.part1(input: intArray), 252724)
        measure {
            let _ = Self.part1(input: intArray)
        }
    }
    
    func testPart2() {
        XCTAssertEqual(Self.part2(input: intArray), 276912720)
        measure {
            let _ = Self.part2(input: intArray)
        }
    }
}

print("Part 1: \(Day1.part1(input: intArray))")
print("Part 2: \(Day1.part2(input: intArray))")
Day1.defaultTestSuite.run()
