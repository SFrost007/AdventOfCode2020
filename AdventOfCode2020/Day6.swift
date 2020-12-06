//
//  Day6.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 06/12/2020.
//

import Foundation

class Day6 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: "\n\n")
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return inputData.map { Self.uniqueAnswers(in: $0) }.reduce(0, +)
    }
    
    func part2() -> Int {
        return inputData.map { Self.answeredByAll(in: $0) }.reduce(0, +)
    }
    
    // MARK: - Worker functions
    
    static func uniqueAnswers(in input: String) -> Int {
        var uniques: Set<Character> = []
        for char in input {
            guard char != "\n" else { continue }
            uniques.insert(char)
        }
        return uniques.count
    }
    
    static func answeredByAll(in input: String) -> Int {
        let people = input.components(separatedBy: .newlines).filter { !$0.isEmpty }
        var answerCounts: [Character: Int] = [:]
        for personAnswer in people {
            for char in personAnswer {
                answerCounts[char] = (answerCounts[char] ?? 0) + 1
            }
        }
        return answerCounts.filter { $0.value == people.count }.count
    }
    
}
