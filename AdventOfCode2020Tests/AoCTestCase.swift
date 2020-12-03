//
//  AoCTestCase.swift
//  AdventOfCode2020Tests
//
//  Created by Simon Frost on 03/12/2020.
//

import XCTest

class AoCTestCase: XCTestCase {
    
    func urlForTestResource(forResource: String, withExtension: String) -> URL {
        let testBundle = Bundle(for: type(of: self))
        return testBundle.url(forResource: forResource, withExtension: withExtension)!
    }
    
    func urlForExampleInput() -> URL {
        let className = String(describing: type(of: self))
        let filename = "\(className.replacingOccurrences(of: "Tests", with: ""))_Example"
        return urlForTestResource(forResource: filename, withExtension: "txt")
    }
    
    func urlForMyInput() -> URL {
        let className = String(describing: type(of: self))
        let filename = "\(className.replacingOccurrences(of: "Tests", with: ""))_MyInput"
        return urlForTestResource(forResource: filename, withExtension: "txt")
    }
    
}
