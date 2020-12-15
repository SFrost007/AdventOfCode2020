//
//  Day15.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 15/12/2020.
//

import Foundation

class Day15 {
    
    // MARK: - Problem cases
    
    static func getAnswer(input: [Int], iterations: Int) -> Int {
        var lastTurnCalled: [Int: Int] = input.enumerated().reduce(into: [:]) { (dict, tuple) in
            let (index, value) = tuple
            dict[value] = index+1 // Turns are 1-based
        }
        var lastNumberCalled = input.last!
        var nextNumber = 0 // Assumes values never repeat in the input, i.e. each input number is only called once
        for turn in (input.count+1)...iterations {
            lastNumberCalled = nextNumber
            if let lastTimeCalled = lastTurnCalled[lastNumberCalled] {
                nextNumber = turn - lastTimeCalled
            } else {
                nextNumber = 0
            }
            lastTurnCalled[lastNumberCalled] = turn
        }
        return lastNumberCalled
    }
    
}
