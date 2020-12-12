//
//  Day12.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 12/12/2020.
//

import Foundation

class Day12 {
    
    enum Heading: Int {
        case north, east, south, west
        
        func toInstruction() -> Instruction {
            switch self {
            case .north: return .north
            case .east: return .east
            case .south: return .south
            case .west: return .west
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
    
    struct Statement {
        let instruction: Instruction
        let value: Int
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
        let position = Self.getEndingPosition(statements: inputData)
        return abs(position.x) + abs(position.y)
    }
    
    func part2() -> Int {
        let position = Self.getEndingPosition(statements: inputData, startWaypoint: Position(x: 10, y: 1))
        return abs(position.x) + abs(position.y)
    }
    
    // MARK: - Worker functions
    
    private static func getEndingPosition(
        statements: [Statement],
        startPosition: Position = Position(x: 0, y: 0),
        startHeading: Heading = .east,
        startWaypoint: Position? = nil
    ) -> Position {
        var heading = startHeading
        var waypoint = startWaypoint
        var position = startPosition
        for statement in statements {
            (position, waypoint, heading) = Self.processStatement(statement, position: position, waypoint: waypoint, heading: heading)
        }
        return position
    }
    
    private static func processStatement(
        _ statement: Statement,
        position: Position,
        waypoint: Position?,
        heading: Heading
    ) -> (Position, Position?, Heading) {
        var newPosition = position
        var newWaypoint = waypoint
        var newHeading = heading
        if let waypoint = waypoint {
            switch statement.instruction {
            case .north:
                newWaypoint?.y += statement.value
            case .south:
                newWaypoint?.y -= statement.value
            case .east:
                newWaypoint?.x += statement.value
            case .west:
                newWaypoint?.x -= statement.value
            case .rotateRight, .rotateLeft:
                newWaypoint = getNewWaypoint(statement: statement, waypoint: waypoint, shipPosition: position)
            case .forward:
                let waypointDelta = Position(x: waypoint.x - position.x, y: waypoint.y - position.y)
                newPosition.x += waypointDelta.x * statement.value
                newPosition.y += waypointDelta.y * statement.value
                newWaypoint = Position(x: newPosition.x + waypointDelta.x, y: newPosition.y + waypointDelta.y)
            }
        } else {
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
                return processStatement(mappedStatement, position: position, waypoint: nil, heading: heading)
            }
        }
        return (newPosition, newWaypoint, newHeading)
    }
    
    static func getNewHeading(statement: Statement, heading: Heading) -> Heading {
        guard statement.instruction == .rotateLeft || statement.instruction == .rotateRight else { fatalError() }
        guard statement.value <= 360 else { fatalError("Rotations beyond 360 degrees not handled") }
        // Map a left rotation into a negative right rotation
        let rotation = statement.instruction == .rotateRight ? statement.value : 360 - statement.value
        let compassStages = rotation / 90
        return Heading(rawValue: (heading.rawValue + compassStages) % 4)!
    }
    
    static func getNewWaypoint(statement: Statement, waypoint: Position, shipPosition: Position) -> Position {
        guard statement.instruction == .rotateLeft || statement.instruction == .rotateRight else { fatalError() }
        guard statement.value <= 360 else { fatalError("Rotations beyond 360 degrees not handled") }
        // Map a left rotation into a negative right rotation
        let rotation = statement.instruction == .rotateRight ? statement.value : 360 - statement.value
        let waypointDelta = Position(x: waypoint.x - shipPosition.x, y: waypoint.y - shipPosition.y)
        let newDelta: Position
        switch rotation {
        case 90:  newDelta = Position(x: waypointDelta.y, y: -waypointDelta.x)
        case 180: newDelta = Position(x: -waypointDelta.x, y: -waypointDelta.y)
        case 270: newDelta = Position(x: -waypointDelta.y, y: +waypointDelta.x)
        default: fatalError("Unhandled rotation amount: \(rotation)")
        }
        return Position(x: shipPosition.x + newDelta.x, y: shipPosition.y + newDelta.y)
    }
    
}
