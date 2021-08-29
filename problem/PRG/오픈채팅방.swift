//
//  오픈채팅방.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/30.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var userInfo : [String: String] = [:]
    
    for r in record {
        let infos = r.split(separator: " ").map { String($0) }
        if infos[0] != "Leave" {
            userInfo[infos[1]] = infos[2]
        }
    }
    
    var answer: [String] = []
    for r in record {
        let infos = r.split(separator: " ").map { String($0) }
        if infos[0] == "Enter" {
            answer.append(userInfo[infos[1]]! + "님이 들어왔습니다.")
        } else if infos[0] == "Leave" {
            answer.append(userInfo[infos[1]]! + "님이 나갔습니다.")
        }
    }
    
    return answer
}
