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
        let memoryResult = Self.runProgram(inputData)
        return Self.getTotalMemoryValue(memory: memoryResult)
    }
    
    func part2() -> Int {
        let memoryResult = Self.runProgram(inputData, part: 2)
        return Self.getTotalMemoryValue(memory: memoryResult)
    }
    
    // MARK: - Worker functions
    
    private static func runProgram(_ instructions: [String], part: Int = 1) -> [UInt64: UInt64] {
        var mask: String = ""
        var memory: [UInt64: UInt64] = [:]
        for instruction in instructions {
            if instruction.hasPrefix("mask") {
                mask = Self.getMaskFromInstruction(instruction)
            } else {
                let (address, value) = Self.getAddressAndValue(instruction)
                switch part {
                case 1:
                    memory[address] = Self.applyMaskToValue(mask: mask, value: value)
                case 2:
                    let (address, value) = Self.getAddressAndValue(instruction)
                    for targetAddress in Self.applyMaskToAddress(mask: mask, address: address) {
                        memory[targetAddress] = value
                    }
                default:
                    fatalError("Invalid part specified")
                }
            }
        }
        return memory
    }
    
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
    
    // Returns a list of addresses possible based on the floating bits in the mask
    static func applyMaskToAddress(mask: String, address: UInt64) -> [UInt64] {
        let onesMask = UInt64(mask.replacingOccurrences(of: "X", with: "0"), radix: 2)!
        let zeroesMask = UInt64(mask.replacingOccurrences(of: "0", with: "1").replacingOccurrences(of: "X", with: "0"), radix: 2)!
        let maskedAddress = (address | onesMask) & zeroesMask
        // Generate all the possible addresses by swapping in "0" and "1" for "X"
        // This isn't particularly efficient but it does the trick
        let addressBinaryString = String(maskedAddress, radix: 2).leadingPadding(toLength: 36, withPad: "0")
        var outputAddresses = [String(addressBinaryString)]
        for (index, char) in mask.enumerated() {
            guard char == "X" else { continue }
            for address in outputAddresses {
                outputAddresses.append(address.replacingCharacter(at: index, with: "1"))
            }
        }
        return outputAddresses.compactMap { UInt64($0, radix: 2) }
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

fileprivate extension String {
    func replacingCharacter(at index: Int, with replacement: Character) -> String {
        var chars = Array(self)
        chars[index] = replacement
        return String(chars)
    }

    func leadingPadding(toLength: Int, withPad: String) -> String {
        let flippedString = String(self.reversed())
        let paddedString = flippedString.padding(toLength: toLength, withPad: withPad, startingAt: 0)
        return String(paddedString.reversed())
    }
}
