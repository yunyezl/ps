//
//  국영수.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/26.
//

import Foundation

let n = Int(readLine()!)

var scores = [(name: String, kor: Int, eng: Int, math: Int)]()
for _ in 0..<n! {
    let array = readLine()!.split(separator: " ").map { String($0) }
    scores.append((name: array[0], kor: Int(array[1])!, eng: Int(array[2])!, math: Int(array[3])!))
}

scores.sort {
    if $0.kor == $1.kor {
        if $0.eng == $1.eng {
            if $0.math == $1.math {
                return $0.name < $1.name
            }
            return $0.math > $1.math
        }
        return $0.eng < $1.eng
    }
    return $0.kor > $1.kor
}

for i in scores {
    print(i.name)
}



