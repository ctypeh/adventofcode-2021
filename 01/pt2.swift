//
//  pt2.swift
//  aoc-2021
//
//  Created by Claire Violet on 12/2/21.
//

import Foundation

var depthIncreases = 0
var mostRecent: [Int] = [0, 0, 0]
var index = 0

var input: String?
var next: Int

//setup for comparing three-measurement sum
for _ in 1...3 {
    input = readLine() ?? ""
    storeValue(value: Int(input!) ?? 0)
}
input = readLine()

while(input != nil) {
    //get current sum
    let prevSum = getSum()
    //get next value
    next = Int(input!) ?? 0
    //get next sum
    let nextSum = prevSum - mostRecent[index] + next
    
    if(prevSum < nextSum ) {
        depthIncreases += 1
    }
    
    //read next input
    input = readLine()
    //move forward
    storeValue(value: next)
}

print(depthIncreases)

func storeValue(value: Int) {
    mostRecent[index] = value
    index = mostRecent.count - 1 == index ? 0 : index + 1
}

func getSum() -> Int {
    var sum = 0
    for val in mostRecent {
        sum += val
    }
    return sum
}
