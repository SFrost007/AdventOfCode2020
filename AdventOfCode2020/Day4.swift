//
//  Day4.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 04/12/2020.
//

import Foundation

class Day4 {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL).components(separatedBy: "\n\n")
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return inputData.filter { Self.isPassportStringValid($0, checkValues: false) }.count
    }
    
    func part2() -> Int {
        return inputData.filter { Self.isPassportStringValid($0, checkValues: true) }.count
    }
    
    // MARK: - Worker functions
    
    static func isPassportStringValid(_ passport: String, checkValues: Bool) -> Bool {
        let dictionary = passportStringToDictionary(passport)
        guard RequiredPassportField.keys.isSubset(of: dictionary.keys) else { return false }
        guard checkValues else { return true }
        return RequiredPassportField.allCases.filter { !$0.validateValue(dictionary[$0.rawValue]!) }.isEmpty
    }
    
    private static func passportStringToDictionary(_ input: String) -> [String: String] {
        return input.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .compactMap { $0.components(separatedBy: ":") }
            .reduce(into: [:], { resultDict, stringParts in
                resultDict[stringParts[0]] = stringParts[1]
            })
    }
    
    // MARK: - Helper enum
    
    enum RequiredPassportField: String, CaseIterable {
        case byr, iyr, eyr, hgt, hcl, ecl, pid
        
        static var keys: Set<String> {
            return Set(self.allCases.compactMap { $0.rawValue })
        }
        
        func validateValue(_ value: String) -> Bool {
            switch self {
            case .byr:
                return (1920...2002).contains(Int(value) ?? -1)
            case .iyr:
                return (2010...2020).contains(Int(value) ?? -1)
            case .eyr:
                return (2020...2030).contains(Int(value) ?? -1)
            case .hgt:
                guard let number = Int(value.prefix(value.count - 2)) else { return false }
                switch value.suffix(2) {
                case "cm": return (150...193).contains(number)
                case "in": return (59...76).contains(number)
                default: return false
                }
            case .hcl:
                return value.range(of: "^#[0-9a-fA-F]{6}$", options: .regularExpression) != nil
            case .ecl:
                let validColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
                return validColors.contains(value)
            case .pid:
                guard value.count == 9 else { return false }
                guard let _ = Int(value) else { return false }
                return true
            }
        }
    }
    
}
