//
//  Day11.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 11/12/2020.
//

import Foundation

/// TODO: Both parts of this are messy and inefficient, and there's significant overlap between them
/// that could probably be refactored. This was a case of "get the answer and move on" unfortunately :(
class Day11 {

    enum SquareState: Character {
        case floor = "."
        case empty = "L"
        case occupied = "#"
    }
    typealias GridState = [[SquareState]]
    
    // MARK: - Initialisation
    
    let inputData: GridState
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { $0.map { SquareState(rawValue: $0)! } }
    }
    
    // MARK: - Part 1
    
    func part1() -> Int {
        var lastState: GridState = []
        var currentState = inputData
        while lastState != currentState {
            lastState = currentState
            currentState = Self.iterate(currentState)
        }
        return Self.countOccupiedSeats(in: currentState)
    }

    private static func iterate(_ gridState: GridState) -> GridState {
        var newState = gridState
        for (y, row) in newState.enumerated() {
            for (x, square) in row.enumerated() {
                guard square != .floor else { continue }
                let occupiedNeighbours = countOccupiedNeighbours(x: x, y: y, in: gridState)
                if square == .empty && occupiedNeighbours == 0 {
                    newState[y][x] = .occupied
                } else if square == .occupied && occupiedNeighbours >= 4 {
                    newState[y][x] = .empty
                }
            }
        }
        return newState
    }

    private static func countOccupiedNeighbours(x: Int, y: Int, in gridState: GridState) -> Int {
        var count = 0
        for checkX in x-1...x+1 {
            for checkY in y-1...y+1 {
                guard checkX != x || checkY != y else { continue }
                guard positionIsValid(x: checkX, y: checkY, in: gridState) else { continue }
                count += gridState[checkY][checkX] == .occupied ? 1 : 0
            }
        }
        return count
    }

    // MARK: - Part 2

    func part2() -> Int {
        var lastState: GridState = []
        var currentState = inputData
        while lastState != currentState {
            lastState = currentState
            currentState = Self.iteratePart2(currentState)
        }
        return Self.countOccupiedSeats(in: currentState)
    }

    private static func iteratePart2(_ gridState: GridState) -> GridState {
        var newState = gridState
        for (y, row) in newState.enumerated() {
            for (x, square) in row.enumerated() {
                guard square != .floor else { continue }
                let occupiedNeighbours = countOccupiedSeatsAround(x: x, y: y, in: gridState)
                if square == .empty && occupiedNeighbours == 0 {
                    newState[y][x] = .occupied
                } else if square == .occupied && occupiedNeighbours >= 5 {
                    newState[y][x] = .empty
                }
            }
        }
        return newState
    }

    private static func countOccupiedSeatsAround(x: Int, y: Int, in gridState: GridState) -> Int {
        var count = 0
        for dx in -1...1 {
            for dy in -1...1 {
                count += isNextSeatOccupied(x: x, y: y, dx: dx, dy: dy, in: gridState) ? 1 : 0
            }
        }
        return count
    }

    private static func isNextSeatOccupied(x: Int, y: Int, dx: Int, dy: Int, in gridState: GridState) -> Bool {
        guard dx != 0 || dy != 0 else { return false }
        var nextX = x + dx, nextY = y + dy
        while positionIsValid(x: nextX, y: nextY, in: gridState) {
            switch gridState[nextY][nextX] {
            case .empty: return false
            case .occupied: return true
            case .floor: break
            }
            nextX += dx
            nextY += dy
        }
        return false
    }

    // MARK: - Shared helper functions

    private static func positionIsValid(x: Int, y: Int, in gridState: GridState) -> Bool {
        guard x >= 0 && x < gridState[0].count else { return false }
        guard y >= 0 && y < gridState.count else { return false }
        return true
    }

    private static func countOccupiedSeats(in gridState: GridState) -> Int {
        return gridState.flatMap { $0 }.filter { $0 == .occupied }.count
    }
    
}
