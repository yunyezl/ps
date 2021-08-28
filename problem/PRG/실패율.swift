//
//  실패율.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/27.
//

import Foundation

func counting(_ target: Int, _ sortedArray: Array<Int>) -> Int {
    var answer = 0
    for element in sortedArray {
        if element == target {
            answer += 1
        }
    }
    return answer
}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var result : [Int: Double] = [:]
    let sortedStages = stages.sorted()
    
    var num = 0
    var deno = stages.count
    
    for i in 1..<N+1 {
        num = counting(i, sortedStages)
        result[i] = Double(num) / Double(deno)
        deno -= num
    }
    
    var answer: [Int] = []
    var sortedResult = result.sorted(by: <).sorted(by: {$0.value > $1.value})
    answer = sortedResult.map{$0.key}

    return answer
}


print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3])) // [3,4,2,1,5]
