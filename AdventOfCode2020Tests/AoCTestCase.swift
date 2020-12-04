//
//  AoCTestCase.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 03/12/2020.
//

import XCTest

class AoCTestCase: XCTestCase {
    
    private class func urlForTestResource(_ resource: String, withExtension: String) -> URL {
        let testBundle = Bundle(for: NSClassFromString(String(reflecting: Self.self))!)
        return testBundle.url(forResource: resource, withExtension: withExtension)!
    }
    
    class func urlForExampleData(day: Int, part: Int? = nil) -> URL {
        let partSuffix = part == nil ? "" : "_Part\(part!)"
        return urlForTestResource("Day\(day)_Example\(partSuffix)", withExtension: "txt")
    }
    
    class func urlForMyInputData(day: Int) -> URL {
        return urlForTestResource("Day\(day)_MyInput", withExtension: "txt")
    }
    
}
