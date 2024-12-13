//
//  BallsAndBuckets.swift
//
//
//  Created by Harland Harrison on 12/6/24.
//
//  Use Terminal to execute:
//       cd  PATH
//       swift BallsAndBuckets.swift
//
// Brute force solution to "Balls & Buckets" Codility challenge.
// This works for their examples but it is not O(n) scaling
// and so not practical for long strings.
//


import Foundation

let impossible = Int.max

public func solution(_ buckets : inout String) -> Int {
 
    let bucketsRA:[Int] = buckets.uppercased().split(separator:"").map(String.init).map{$0=="B" ? 1 : 0}
    var evenRA:[Int] = []
    var oddRA:[Int] = []
    var oddBalls = 0
    var evenBalls = 0
    
    for i in 0...bucketsRA.count-1 {
        let odd = i&1 == 1
        let ball = bucketsRA[i] == 1
        if odd {
            oddRA.append(bucketsRA[i])
            if ball {oddBalls = oddBalls+1}
        } else {
            evenRA.append(bucketsRA[i])
            if ball {evenBalls = evenBalls+1}
        }
    }
    
    // Trivial cases of zero or one ball
    if evenBalls+oddBalls<2 {return 0}

    // Start by moving all evens or all odds
    let osol = minimumMoves(oddRA,evenBalls,oddBalls,0,oddRA.count-1)
    let esol = minimumMoves(evenRA,oddBalls,evenBalls,0,evenRA.count-1)

    var result = impossible
    if esol < osol {
        result = esol
    } else {
        result = osol
    }
    if result == impossible {
        result = -1
    }
    return result
}

// Pack all of an array together, recursively and non-linearally
func minimumMoves(_ RA:[Int],_ moved:Int,_ unmoved:Int, _ firstIn:Int, _ lastIn:Int)-> Int {
    if moved + unmoved > RA.count {return impossible}
    if unmoved < 2 {return moved}

    var first = firstIn
    var last = lastIn
    while RA[first] == 0 {
        first = first + 1
    }
    while RA[last] == 0 {
        last = last - 1
    }
    let space = last-first+1
    let holes = space - unmoved
    if holes <= moved  {return moved}
    
    var leftRA = RA
    var rightRA = RA
    
    leftRA[first] = 0
    rightRA[last] = 0
    
    // Try moving one from one end or from the other
    let leftMin = minimumMoves(leftRA,moved+1,unmoved-1,first,last)
    let rightMin = minimumMoves(rightRA,moved+1,unmoved-1,first,last)
    
    return min(leftMin,rightMin)
}

func testOne (_ A:String) {
    var B = A
    let result = solution(&B)
    print("\(result) <- \(B)")
}

func testBuckets() {
    testOne(".BBB.B")
    testOne("......B.B")
    testOne("..B....B.BB")
    testOne("BB.B.BBB...")
    testOne("B.B..B")
    testOne("B...B...B...B...B...B...B")
}

// Long strings take exponential resources
func crashBuckets() {
    var x = ".B.B.BBB..BBBB.BB..B...BB...BB...B...."
    x = x+x+x+x
    x = x+x+x+x
    x = x+x+x+x
    x = x+x+x+x
    testOne(x)
}

print("BallsAndBuckets.swift = A Brute Force solution")
print("to the 'Balls and Buckets' Codility challenge.")
testBuckets()
//crashBuckets


