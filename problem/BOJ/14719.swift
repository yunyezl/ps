//
//  빗물.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/29.
//

import Foundation

import Foundation

func find(_ height: Int, _ width: Int) -> Int {
    var result = 0
    for h in stride(from: height - 1, through: 0, by: -1) {
        for w in 0..<width {
            if blocks[h][w] == 1 {
                var temp = 0
                for i in w+1..<width {
                    if blocks[h][i] == 1 {
                        result += temp
                        temp = 0
                        break
                    } else {
                        temp += 1
                    }
                }
            }
        }
    }
    return result
}

var hw: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var numOfBlock: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let height = hw[0]
let width = hw[1]
var blocks: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)

for i in 0..<width {
    for j in stride(from: height - 1, through: height - numOfBlock[i], by: -1) {
        blocks[j][i] = 1
    }
}

print(find(height, width))
