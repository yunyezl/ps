//
//  안테나.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/26.
//

import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int(String($0))! }

array.sort()
print(array[(n - 1) / 2])
