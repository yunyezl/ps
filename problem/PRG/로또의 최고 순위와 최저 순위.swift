//
//  로또의 최고 순위와 최저 순위.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/30.
//

import Foundation

func findRanking(_ matingNumber: Int) -> Int {
    switch matingNumber {
    case 2:
        return 5
    case 3:
        return 4
    case 4:
        return 3
    case 5:
        return 2
    case 6:
        return 1
    default:
        return 6
    }
}

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var matchingNumber = 0
    var hiddenNumber = 0
    
    for lotto in lottos {
        if lotto == 0 {
            hiddenNumber += 1
        } else if win_nums.contains(lotto) {
            matchingNumber += 1
        }
    }
    
    return [findRanking(matchingNumber + hiddenNumber), findRanking(matchingNumber)]
}

print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))
