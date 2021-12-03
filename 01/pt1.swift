//
//  Advent of Code 2021
//  Day 1, Part 1
//
//  Created by Claire Violet on 12/1/21.
//

import Foundation

var depthIncreases = 0, prev, next: Int

var input : String?

//read first value
input = readLine() ?? ""
prev = Int(input!) ?? 0
//read second value
input = readLine()

while(input != nil) {
    //parse int into next
    next = Int(input!) ?? 0
    
    if(prev < next ) {
        depthIncreases += 1
    }
    
    //read next input
    input = readLine()
    //move forward
    prev = next
}

print(depthIncreases)
