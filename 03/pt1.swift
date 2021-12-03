//
//  Advent of Code 2021
//  Day 3, Part 1
//
//  Created by Claire Violet on 12/3/21.
//

import Foundation

var lines = 0
var occurencesOfOne = [0,0,0,0,0,0,0,0,0,0,0,0]

var input : String?

input = readLine()

let one: Character = "1"
while(input != nil) {
    lines += 1
    var i = 0
    for char in input! {
        if(char == one) {
            //count number of times 1 appears in this column
            occurencesOfOne[i] += 1
        }
        i += 1
    }
    
    //read next input
    input = readLine()
}

var gammaParse: String = ""
var epsilonParse: String = ""

for digit in occurencesOfOne {
    let oneIsMostCommonDigit = (digit >= lines/2)
    //most common digit
    gammaParse += oneIsMostCommonDigit ? "1" : "0"
    //least common digit
    epsilonParse += oneIsMostCommonDigit ? "0" : "1"
}

var gamma: Int
var epsilon: Int

gamma = Int(gammaParse, radix: 2)!
epsilon = Int(epsilonParse, radix: 2)!

print("gamma: \(gamma)")
print("epsilon: \(epsilon)")
print("product: \(gamma * epsilon)")
