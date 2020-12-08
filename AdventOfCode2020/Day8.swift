//
//  Day8.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 8/12/2020.
//

import Foundation

class Day8 {
    
    enum Operation: String {
        case nop, acc, jmp
    }
    
    struct Instruction {
        let opp: Operation
        let arg: Int
    }
    
    // MARK: - Initialisation
    
    let program: [Instruction]
    var pc: Int = 0
    var acc: Int = 0
    var visited: Set<Int> = []
    
    init(inputURL: URL) {
        program = try! String(contentsOf: inputURL).components(separatedBy: .newlines).filter { !$0.isEmpty }
            .map { $0.components(separatedBy: .whitespaces) }
            .map {
                let opp = Operation(rawValue: $0[0])!
                let arg = Int($0[1].replacingOccurrences(of: "+", with: ""))!
                return Instruction(opp: opp, arg: arg)
            }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        while !visited.contains(pc) {
            visited.insert(pc)
            processInstruction()
        }
        return acc
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    private func processInstruction() {
        switch program[pc].opp {
        case .nop:
            pc += 1
        case .acc:
            acc = acc + program[pc].arg
            pc += 1
        case .jmp:
            pc += program[pc].arg
        }
    }
    
}
