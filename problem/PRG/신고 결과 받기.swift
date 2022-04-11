func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report = Array(Set(report))
    var dic: [String: [String]] = [:]
    var answer = Array(repeating: 0, count: id_list.count)
    
    var ids: [String: Int] = [:]
     
     for (index, id) in id_list.enumerated() {
         ids[id] = index
     }
    
    report.forEach { list in
        let splited = list.split(separator: " ").map { String($0) }
        if let _ = dic[splited[1]] {
            dic[splited[1]]!.append(splited[0])
        } else {
            dic[splited[1]] = [splited[0]]
        }
    }
    
    for name in dic.keys {
        if dic[name]!.count >= k {
            for n in dic[name]! {
                answer[ids[n]!] += 1
            }
        }
    }
    return answer
}

// 22.04.11 (월)

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportInfo: [String: Set<String>] = [:]
    
    for r in report {
        let info = r.split(separator: " ")
        let (reporter, reported) = (String(info[0]), String(info[1]))
        if let _ = reportInfo[reporter] {
            reportInfo[reporter]!.update(with: reported)
        } else {
            reportInfo[reporter] = [reported]
        }
    }
    
    var reporterCount: [String: Int] = [:]
    for r in reportInfo {
        for reported in r.value {
            if let _ = reporterCount[String(reported)] {
                reporterCount[String(reported)]! += 1
            } else {
                reporterCount[String(reported)] = 1
            }
        }
    }
    
    var answer: [Int] = []
    for id in id_list {
        var result = 0
        if let _ = reportInfo[id] {
            for reported in reportInfo[id]! {
                if let count = reporterCount[reported] {
                    if count >= k {
                        result += 1
                    }
                }   
            }
        }
        answer.append(result)
    }

    return answer
}
