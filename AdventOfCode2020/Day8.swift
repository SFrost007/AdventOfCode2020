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
    
    let inputData: [Instruction]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).filter { !$0.isEmpty }
            .map { $0.components(separatedBy: .whitespaces) }
            .map {
                let opp = Operation(rawValue: $0[0])!
                let arg = Int($0[1].replacingOccurrences(of: "+", with: ""))!
                return Instruction(opp: opp, arg: arg)
            }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        let (_, result) = runProgram(inputData)
        return result
    }
    
    func part2() -> Int {
        for i in 0..<inputData.count {
            guard inputData[i].opp != .acc else { continue }
            var modifiedProgram = inputData
            modifiedProgram[i] = Instruction(opp: inputData[i].opp == .jmp ? .nop : .jmp, arg: inputData[i].arg)
            let (completed, result) = runProgram(modifiedProgram)
            if completed {
                return result
            }
        }
        return -1
    }
    
    // MARK: - Worker functions
    
    private func runProgram(_ program: [Instruction]) -> (Bool, Int) {
        var pc = 0
        var acc = 0
        var visited: Set<Int> = []
        while pc < program.count && !visited.contains(pc) {
            //print("@\(pc): \(program[pc].opp.rawValue) \(program[pc].arg)")
            visited.insert(pc)
            switch program[pc].opp {
            case .nop:
                pc += 1
            case .acc:
                acc += program[pc].arg
                pc += 1
            case .jmp:
                pc += program[pc].arg
            }
            //print("  pc: \(pc), acc: \(acc), visited: \(visited.sorted().map { String($0) }.joined(separator: ","))")
        }
        return (pc >= program.count, acc)
    }
    
}
