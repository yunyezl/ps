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

// 22.04.11 (월)

import Foundation

enum Action: Equatable {
    case enter(id: String)
    case leave(id: String)
    
    func toKorean() -> String {
        switch self {
        case .enter(let id):
            return id + "님이 들어왔습니다."
        case .leave(let id):
            return id + "님이 나갔습니다."
        }
    }
}

func solution(_ record:[String]) -> [String] {
    var ids: [String: String] = [:]
    for r in record {
        let info = r.split(separator: " ")
        if info[0] == "Enter" || info[0] == "Change" {
            ids[String(info[1])] = String(info[2])
        }
    }
    
    var answer: [String] = []
    for r in record {
        let info = r.split(separator: " ")
        if info[0] == "Enter" {
            answer.append(Action.enter(id: ids[String(info[1])]!).toKorean())
        } else if info[0] == "Leave" {
            answer.append(Action.leave(id: ids[String(info[1])]!).toKorean())
        }
    }
    return answer
}
