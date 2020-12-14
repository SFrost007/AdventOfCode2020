//
//  Day14.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 14/12/2020.
//

import Foundation

class Day14 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: .newlines).filter { !$0.isEmpty }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        var mask: String = ""
        var memory: [UInt64: UInt64] = [:]
        for instruction in inputData {
            if instruction.hasPrefix("mask") {
                mask = Self.getMaskFromInstruction(instruction)
            } else {
                let (address, value) = Self.getAddressAndValue(instruction)
                memory[address] = Self.applyMaskToValue(mask: mask, value: value)
            }
        }
        return Self.getTotalMemoryValue(memory: memory)
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    static func getMaskFromInstruction(_ instruction: String) -> String {
        return instruction.components(separatedBy: " = ")[1]
    }
    
    static func getAddressAndValue(_ instruction: String) -> (UInt64, UInt64) {
        let parts = instruction.components(separatedBy: " = ")
        let invalidAddressChars = CharacterSet(charactersIn: "mem[]")
        let address = UInt64(parts[0].trimmingCharacters(in: invalidAddressChars))!
        let value = UInt64(parts[1])!
        return (address, value)
    }
    
    static func applyMaskToValue(mask: String, value: UInt64) -> UInt64 {
        let zeroesMask = UInt64(mask.replacingOccurrences(of: "X", with: "1"), radix: 2)!
        let onesMask = UInt64(mask.replacingOccurrences(of: "X", with: "0"), radix: 2)!
        return (value | onesMask) & zeroesMask
    }
    
    static func getTotalMemoryValue(memory: [UInt64: UInt64]) -> Int {
        return memory.map { Int($0.value) }.reduce(0, +)
    }
    
}
