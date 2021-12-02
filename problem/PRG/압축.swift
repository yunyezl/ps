import Foundation

func solution(_ msg:String) -> [Int] {
    
    var dic: [String: Int] = [:]
    
    var initial = 97
    for i in 1..<27 {
        dic[String(UnicodeScalar(initial)!).uppercased()] = i
        initial += 1
    }
    
    var last = 26
    
    let msg = Array(msg).map { String($0) }
    var i = 0
    var answer: [Int] = []
    var isLast: Bool = false
    
    // 그 다음 글자를 포함하는 딕셔너리가 없을 때 까지 하위 반복문 돌림.
    // 없으면 딕셔너리에 해당 글자 추가하고 색인 번호 하나 증가
    while true {
        if isLast {
            break
        }
        var j = i
        var string = ""
        while true {
            if j >= msg.count {
                isLast = true
                answer.append(dic[string]!)
                break
            }
            string = msg[i...j].joined(separator: "")
            if let _ = dic[string] {
                j += 1
            } else {
                last += 1
                dic[string] = last
                answer.append(dic[msg[i...j-1].joined(separator: "")]!)
                break
            }
        }
        i += string.count > 1 ? string.count - 1 : 1
    }
    
    return answer
}
