//
//  퇴사.swift
//  CodingTest
//
//  Created by 윤예지 on 2022/03/25.
//

import Foundation

let n = Int(readLine()!)!
var array = Array(repeating: (0, 0), count: n + 2)
var dp = Array(repeating: 0, count: n + 2)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    array[i] = (input[0], input[1])
}

var currentMax = 0
for i in 1...n+1 {
    let (time, pay) = array[i]
    currentMax = max(currentMax, dp[i])
    if i + time > n + 1 { continue }
    dp[i + time] = max(currentMax + pay, dp[i + time])
}

print(currentMax)

