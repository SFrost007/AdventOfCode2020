//
//  Day16.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 16/12/2020.
//

import Foundation

class Day16 {

    typealias Ticket = [Int]

    struct TicketField: Hashable {
        let fieldName: String
        let validRanges: [Range<Int>]

        init(string: String) {
            let parts = string.components(separatedBy: ": ")
            fieldName = parts[0]
            validRanges = parts[1].components(separatedBy: " or ").map {
                let numbers = $0.components(separatedBy: "-")
                let min = Int(numbers[0])!
                let max = Int(numbers[1])!
                return Range(min...max)
            }
        }

        func isValueValid(_ value: Int) -> Bool {
            return validRanges.filter { $0.contains(value) }.count > 0
        }
    }
    
    // MARK: - Initialisation

    let fields: [TicketField]
    let myTicket: Ticket
    let nearbyTickets: [Ticket]
    
    init(inputURL: URL) {
        let sections: [[String]] = try! String(contentsOf: inputURL)
            .components(separatedBy: "\n\n")
            .map { $0.components(separatedBy: .newlines) }
        fields = sections[0].compactMap { TicketField(string: $0) }
        myTicket = sections[1][1].components(separatedBy: ",").map { Int($0)! }
        nearbyTickets = sections[2][1...]
            .filter { !$0.isEmpty }
            .map { $0.components(separatedBy: ",").compactMap { Int($0) } }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        return nearbyTickets
            .flatMap { Self.invalidFieldValues(ticket: $0, allowedRanges: allFieldRanges) }
            .reduce(0, +)
    }
    
    func part2() -> Int {
        return Self.findFieldIndexes(validTickets: validTickets, fields: fields)
            .filter { $0.key.fieldName.hasPrefix("departure") }
            .map { myTicket[$0.value] }
            .reduce(1, *)
    }
    
    // MARK: - Worker functions

    var allFieldRanges: [Range<Int>] {
        return fields.flatMap { $0.validRanges }
    }

    var validTickets: [Ticket] {
        return nearbyTickets
            .filter { Self.invalidFieldValues(ticket: $0, allowedRanges: allFieldRanges).isEmpty }
            + [myTicket]
    }

    static func invalidFieldValues(ticket: Ticket, allowedRanges: [Range<Int>]) -> [Int] {
        return ticket.filter {
            for range in allowedRanges {
                if range.contains($0) {
                    return false
                }
            }
            return true // Matched no ranges
        }
    }

    static func findFieldIndexes(validTickets: [Ticket], fields: [TicketField]) -> [TicketField: Int] {
        let valuesByField = ticketValuesGroupedByField(validTickets: validTickets)
        var foundFields: [TicketField: Int] = [:]
        while foundFields.count != fields.count {
            let alreadyMatchedIndexes = foundFields.map { $0.value }
            for field in fields {
                var possibleIndexes: [Int] = []
                for (index, fieldValues) in valuesByField.enumerated() {
                    guard !alreadyMatchedIndexes.contains(index) else { continue }
                    let validValues = fieldValues.filter { field.isValueValid($0) }
                    if validValues.count == fieldValues.count {
                        possibleIndexes.append(index)
                    }
                }
                if possibleIndexes.count == 1 {
                    foundFields[field] = possibleIndexes.first!
                    // Note: Could optimise here by keeping the possible field indexes for previously processed fields,
                    // then filtering the one we have a confirmed match for, and matching any that now count 1.
                    break
                }
            }
        }
        return foundFields
    }

    static func ticketValuesGroupedByField(validTickets: [Ticket]) -> [[Int]] {
        return (0..<validTickets[0].count).map { fieldIndex in
            validTickets.map { $0[fieldIndex] }
        }
    }
    
}
