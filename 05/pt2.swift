//
//  Advent of Code 2021
//  Day 5, Part 1
//
//  Created by Claire Violet on 12/5/21.
//

import Foundation

var input: String?

struct Coordinate {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func stringify() -> String {
        return "\(x),\(y)"
    }
}

struct Line {
    let start: Coordinate
    let end: Coordinate
}

var positions: [String: Int] = [:]

var countAboveTwo = 0

input = readLine()
while(input != nil) {
    //parse endpoints
    let line = parseLine(inputLine: input!)
    var current = line.start
    print("line: \(line.start.x),\(line.start.y) -> \(line.end.x),\(line.end.y)")
    //if(line.start.x == line.end.x || line.start.y == line.end.y) {
        while(current.x != line.end.x || current.y != line.end.y) {
            markCoord(position: current.stringify())
            //determine which axis changes
            //iterate over that axis
            if(current.x < line.end.x) {
                current.x += 1
            }
            if(current.x > line.end.x) {
                current.x -= 1
            }
            if(current.y < line.end.y) {
                current.y += 1
            }
            if(current.y > line.end.y) {
                current.y -= 1
            }
        }
        markCoord(position: line.end.stringify())
    //}
    
    //read next input
    input = readLine()
}

//for entry in positions.values {}

print(countAboveTwo)

func parseLine(inputLine: String) -> Line {
    let splitLeft = inputLine.firstIndex(of: " ") ?? inputLine.endIndex
    let splitRight = inputLine.lastIndex(of: " ") ?? inputLine.endIndex
    let startCoord = inputLine.prefix(upTo: splitLeft).trimmingCharacters(in: .whitespacesAndNewlines)
    let endCoord = inputLine.suffix(from: splitRight).trimmingCharacters(in: .whitespacesAndNewlines)
    return Line(start: parseCoord(coordinatePair: String(startCoord)), end: parseCoord(coordinatePair: String(endCoord)))
}

func parseCoord(coordinatePair: String) -> Coordinate {
    let split = coordinatePair.firstIndex(of: ",") ?? coordinatePair.endIndex
    let x = coordinatePair.prefix(upTo: split)
    let y = coordinatePair.suffix(from: split).hasPrefix(",") ? coordinatePair.suffix(from: split).dropFirst(1) : coordinatePair.suffix(from: split)
    return Coordinate(x: Int(x) ?? 0, y: Int(String(y)) ?? 0)
}

func markCoord(position: String) {
    let count = positions[position] ?? 0
    if(count == 1) {
        countAboveTwo += 1
    }
    positions[position] = count + 1
    print("position: \(position) count: \(count + 1) total: \(countAboveTwo)")
}
