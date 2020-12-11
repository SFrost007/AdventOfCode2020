//
//  Day11.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 11/12/2020.
//

import Foundation

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
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        var lastState: GridState = []
        var currentState = inputData
        while lastState != currentState {
            lastState = currentState
            currentState = Self.iterate(currentState)
        }
        return Self.countOccupiedSeats(in: currentState)
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
    // MARK: - Worker functions

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

    // TODO: This is really inefficient
    private static func countOccupiedNeighbours(x: Int, y: Int, in gridState: GridState) -> Int {
        var count = 0
        for checkX in x-1...x+1 {
            for checkY in y-1...y+1 {
                guard checkX != x || checkY != y else { continue }
                guard checkX >= 0 && checkX < gridState[0].count else { continue }
                guard checkY >= 0 && checkY < gridState.count else { continue }
                count += gridState[checkY][checkX] == .occupied ? 1 : 0
            }
        }
        return count
    }

    private static func countOccupiedSeats(in gridState: GridState) -> Int {
        return gridState.flatMap { $0 }.filter { $0 == .occupied }.count
    }
    
}
