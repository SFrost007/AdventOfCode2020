//
//  Day7.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 7/12/2020.
//

import Foundation

class Day7 {
    
    struct ContainedBag: Hashable {
        let color: String
        let count: Int
    }
    
    struct Instruction: Equatable {
        let containerBagColor: String
        let innerBags: [ContainedBag]
    }
    
    // MARK: - Initialisation
    
    let inputData: [Instruction]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { Self.parseInstruction($0) }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return Self.findAllowedOuterBags(for: ["shiny gold"], in: inputData).count
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    private static func parseInstruction(_ input: String) -> Instruction {
        // e.g. input:
        //  bright white bags contain 1 shiny gold bag.
        //  shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
        //  faded blue bags contain no other bags.
        let outerSplit = input.components(separatedBy: " bags contain ")
        guard !outerSplit[1].contains("no other") else {
            return Instruction(containerBagColor: outerSplit[0], innerBags: [])
        }
        let innerParts = outerSplit[1].components(separatedBy: ", ")
            .map { $0.replacingOccurrences(of: ".", with: "") }
            .map { $0.replacingOccurrences(of: " bags", with: "") }
            .map { $0.replacingOccurrences(of: " bag", with: "") } // TODO: Would be better as a regex
        let innerBags = innerParts.map { (rawInput: String) -> ContainedBag in
            let parts = rawInput.components(separatedBy: .whitespaces)
            let count = Int(parts[0])!
            let color = parts[1...].joined(separator: " ")
            return ContainedBag(color: color, count: count)
        }
        return Instruction(containerBagColor: outerSplit[0], innerBags: innerBags)
    }
    
    static func findAllowedOuterBags(for colors: [String], in instructions: [Instruction]) -> [String] {
        return []
    }
    
}
