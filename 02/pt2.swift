//
//  Advent of Code 2021
//  Day 2, Part 2
//
//  Created by Claire Violet on 12/3/21.
//

import Foundation

var depth = 0
var distance = 0
var aim = 0

var input : String?

input = readLine()

while(input != nil) {
    let split = input!.firstIndex(of: " ") ?? input!.endIndex
    let movement = input!.prefix(upTo: split)
    let value = Int(input!.suffix(from: split).trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
    
    switch movement {
    case "forward":
        distance += value
        depth += aim * value
    case "up":
        aim -= value
    case "down":
        aim += value
    default:
        print("encountered unexpected movement: \(movement)")
    }
    
    //read next input
    input = readLine()
}

print("depth = \(depth)")
print("distance = \(distance)")
print("product = \(depth * distance)")
