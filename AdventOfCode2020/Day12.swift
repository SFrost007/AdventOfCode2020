//
//  Day12.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 12/12/2020.
//

import Foundation

class Day12 {
    
    enum Heading: Int, CustomStringConvertible {
        
        case north, east, south, west
        
        func toInstruction() -> Instruction {
            switch self {
            case .north: return .north
            case .east: return .east
            case .south: return .south
            case .west: return .west
            }
        }
        
        var description: String {
            switch self {
            case .north: return "North"
            case .east: return "East"
            case .south: return "South"
            case .west: return "West"
            }
        }
    }
    
    struct Position {
        var x: Int
        var y: Int
    }
    
    enum Instruction: String {
        case north = "N"
        case east = "E"
        case south = "S"
        case west = "W"
        case rotateRight = "R"
        case rotateLeft = "L"
        case forward = "F"
    }
    
    struct Statement: CustomStringConvertible {
        let instruction: Instruction
        let value: Int
        
        var description: String {
            return "\(instruction.rawValue)\(value)"
        }
    }
    
    // MARK: - Initialisation
    
    let inputData: [Statement]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { (String($0.prefix(1)), Int($0.suffix($0.count-1))!) }
            .map { Statement(instruction: Instruction(rawValue: $0.0)!, value: $0.1) }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        var heading = Heading.east
        var position = Position(x: 0, y: 0)
        for statement in inputData {
            (position, heading) = Self.processStatement(statement, position: position, heading: heading)
        }
        return abs(position.x) + abs(position.y)
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions
    
    static func processStatement(_ statement: Statement, position: Position, heading: Heading) -> (Position, Heading) {
        var newPosition = position
        var newHeading = heading
        switch statement.instruction {
        case .north:
            newPosition.y += statement.value
        case .south:
            newPosition.y -= statement.value
        case .east:
            newPosition.x += statement.value
        case .west:
            newPosition.x -= statement.value
        case .rotateRight, .rotateLeft:
            newHeading = getNewHeading(statement: statement, heading: heading)
        case .forward:
            let mappedStatement = Statement(instruction: heading.toInstruction(), value: statement.value)
            return processStatement(mappedStatement, position: position, heading: heading)
        }
        return (newPosition, newHeading)
    }
    
    static func getNewHeading(statement: Statement, heading: Heading) -> Heading {
        guard statement.instruction == .rotateLeft || statement.instruction == .rotateRight else { fatalError() }
        guard statement.value <= 360 else { fatalError("Rotations beyond 360 degrees not handled") }
        // Map a left rotation into a negative right rotation
        let rotation = statement.instruction == .rotateRight ? statement.value : 360 - statement.value
        let compassStages = rotation / 90
        return Heading(rawValue: (heading.rawValue + compassStages) % 4)!
    }
    
}
