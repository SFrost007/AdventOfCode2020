//
//  Day16.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 16/12/2020.
//

import Foundation

class Day16 {

    typealias Ticket = [Int]

    struct TicketField {
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
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions

    var allFieldRanges: [Range<Int>] {
        return fields.flatMap { $0.validRanges }
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
    
}
