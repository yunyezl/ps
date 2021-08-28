//
//  괄호의 값.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/29.
//

import Foundation

var input = Array(readLine()!).map { String($0) }
var stack = [String]()
var result = 0
var temp = 1
var isRight = true

for i in 0..<input.count {
    switch input[i] {
    case "(" :
        temp *= 2
        stack.append(input[i])
    case "[" :
        temp *= 3
        stack.append(input[i])
    case ")":
        if stack.isEmpty || stack.last != "(" {
            isRight = false
            break
        }
        if input[i-1] == "(" {
            result += temp
        }
        stack.removeLast()
        temp /= 2
    case "]" :
        if stack.isEmpty || stack.last != "[" {
            isRight = false
            break
        }
        if input[i-1] == "[" {
            result += temp
        }
        stack.removeLast()
        temp /= 3
    default:
        break
    }
}
if !isRight || !stack.isEmpty {
    print(0)
} else {
    print(result)
}
