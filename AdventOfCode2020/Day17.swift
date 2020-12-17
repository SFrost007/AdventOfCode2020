//
//  Day17.swift
//  AdventOfCode2020
//
//  Created by Simon Frost on 17/12/2020.
//

import Foundation

class Day17 {

    typealias CubeState = [[[Bool]]]
    
    // MARK: - Initialisation
    
    let inputData: [[Bool]]
    
    init(inputURL: URL) {
        inputData = try! String(contentsOf: inputURL)
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { $0.map { $0 == "#" } }
    }
    
    // MARK: - Part 1
    
    func part1() -> Int {
        var cubeState = [inputData]
        cubeState.dumpState()
        for i in 1...6 {
            print("***** Iteration \(i)")
            cubeState = Self.processCycle(inputState: cubeState)
            cubeState.dumpState()
        }
        return Self.countActiveCubes(in: cubeState)
    }

    private static func processCycle(inputState: CubeState) -> CubeState {
        let expandedCubeState = expandCubeState(inputState)
        var newCubeState = expandedCubeState // Copy so we can modify as we go without affecting future checks
        for (z, plane) in newCubeState.enumerated() {
            for (y, row) in plane.enumerated() {
                for (x, active) in row.enumerated() {
                    let neighbours = activeNeighboursOf(x: x, y: y, z: z, in: expandedCubeState)
                    if !active {
                        if neighbours == 3 {
                            newCubeState[z][y][x] = true
                        }
                    } else {
                        if neighbours < 2 || neighbours > 3 {
                            newCubeState[z][y][x] = false
                        }
                    }
                }
            }
        }
        return newCubeState
    }

    /// Expand the CubeState by one inactive cube in each dimension to prepare for another iteration
    /// For now this unintelligently expands by one unit without checking whether that's needed
    /// (e.g. if we already have a fully empty plane at the edge of the cube, this will still add another)
    private static func expandCubeState(_ state: CubeState) -> CubeState {
        var newCubeState = state

        let existingHeight = state[0].count
        let existingWidth = state[0][0].count
        // There's definitely a better way of doing this, but ¯\_(ツ)_/¯
        let emptyRow = String(repeating: ".", count: existingWidth+2).map { $0 == "#" }
        let emptyPlane = String(repeating: ".", count: existingHeight+2).map { _ in emptyRow }

        for (z, plane) in newCubeState.enumerated() {
            for (y, row) in plane.enumerated() {
                newCubeState[z][y] = [false] + row + [false]
            }
            newCubeState[z] = [emptyRow] + newCubeState[z] + [emptyRow]
        }
        return [emptyPlane] + newCubeState + [emptyPlane]
    }

    private static func activeNeighboursOf(x: Int, y: Int, z: Int, in state: CubeState) -> Int {
        var neighbours = 0
        for checkZ in max(z-1, 0)...min(z+1, state.count-1) {
            for checkY in max(y-1, 0)...min(y+1, state[0].count-1) {
                for checkX in max(x-1, 0)...min(x+1, state[0][0].count-1) {
                    guard x != checkX || y != checkY || z != checkZ else { continue }
                    neighbours += state[checkZ][checkY][checkX] ? 1 : 0
                }
            }
        }
        return neighbours
    }

    private static func countActiveCubes(in state: CubeState) -> Int {
        return state.flatMap { $0.flatMap { $0 } }
            .filter { $0 }
            .count
    }

    // MARK: - Part 2
    // This is just a dumb copy of part 1 with an extra loop depth added :-/

    typealias HyperCubeState = [CubeState]

    func part2() -> Int {
        var hyperCubeState = [[inputData]]
        for i in 1...6 {
            print("***** Iteration \(i)")
            hyperCubeState = Self.processHyperCycle(inputState: hyperCubeState)
            hyperCubeState.dumpState()
        }
        return Self.countHyperActiveCubes(in: hyperCubeState)
    }

    private static func processHyperCycle(inputState: HyperCubeState) -> HyperCubeState {
        let expandedCubeState = expandHyperCubeState(inputState)
        var newCubeState = expandedCubeState // Copy so we can modify as we go without affecting future checks
        for (w, dimension) in newCubeState.enumerated() {
            for (z, plane) in dimension.enumerated() {
                for (y, row) in plane.enumerated() {
                    for (x, active) in row.enumerated() {
                        let neighbours = activeHyperNeighboursOf(x: x, y: y, z: z, w: w, in: expandedCubeState)
                        if !active {
                            if neighbours == 3 {
                                newCubeState[w][z][y][x] = true
                            }
                        } else {
                            if neighbours < 2 || neighbours > 3 {
                                newCubeState[w][z][y][x] = false
                            }
                        }
                    }
                }
            }
        }
        return newCubeState
    }

    /// Expand the CubeState by one inactive cube in each dimension to prepare for another iteration
    /// For now this unintelligently expands by one unit without checking whether that's needed
    /// (e.g. if we already have a fully empty plane at the edge of the cube, this will still add another)
    private static func expandHyperCubeState(_ state: HyperCubeState) -> HyperCubeState {
        var newCubeState = state

        let existingDepth = state[0].count
        let existingHeight = state[0][0].count
        let existingWidth = state[0][0][0].count
        // There's definitely a better way of doing this, but ¯\_(ツ)_/¯
        let emptyRow = String(repeating: ".", count: existingWidth+2).map { $0 == "#" }
        let emptyPlane = String(repeating: ".", count: existingHeight+2).map { _ in emptyRow }
        let emptyDimension = String(repeating: ".", count: existingDepth+2).map { _ in emptyPlane }

        for (w, dimension) in newCubeState.enumerated() {
            for (z, plane) in dimension.enumerated() {
                for (y, row) in plane.enumerated() {
                    newCubeState[w][z][y] = [false] + row + [false]
                }
                newCubeState[w][z] = [emptyRow] + newCubeState[w][z] + [emptyRow]
            }
            newCubeState[w] = [emptyPlane] + newCubeState[w] + [emptyPlane]
        }
        return [emptyDimension] + newCubeState + [emptyDimension]
    }

    private static func activeHyperNeighboursOf(x: Int, y: Int, z: Int, w: Int, in state: HyperCubeState) -> Int {
        var neighbours = 0
        for checkW in max(w-1, 0)...min(w+1, state.count-1) {
            for checkZ in max(z-1, 0)...min(z+1, state[0].count-1) {
                for checkY in max(y-1, 0)...min(y+1, state[0][0].count-1) {
                    for checkX in max(x-1, 0)...min(x+1, state[0][0][0].count-1) {
                        guard w != checkW || x != checkX || y != checkY || z != checkZ else { continue }
                        neighbours += state[checkW][checkZ][checkY][checkX] ? 1 : 0
                    }
                }
            }
        }
        return neighbours
    }

    private static func countHyperActiveCubes(in state: HyperCubeState) -> Int {
        return state.flatMap { $0.flatMap { $0.flatMap { $0 } } }
            .filter { $0 }
            .count
    }
    
}

// MARK: - Debug logging helpers

fileprivate extension Day17.CubeState {
    func dumpState() {
        let zOffset = Int(self.count/2)
        for (z, plane) in self.enumerated() {
            print("z=\(z - zOffset)")
            for row in plane {
                print(row.map { $0 ? "#" : "." }.joined())
            }
            print("")
        }
    }
}

fileprivate extension Day17.HyperCubeState {
    func dumpState() {
        let wOffset = Int(self.count/2)
        for (w, dimension) in self.enumerated() {
            print("w=\(w - wOffset)")
            dimension.dumpState()
            print("")
        }
    }
}
