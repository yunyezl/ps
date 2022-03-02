import Foundation

func solution(_ gems: [String]) -> [Int] {
    let kinds = Set(gems).count
    
    var gemCountDic: [String: Int] = [:]
    var start = 0
    var end = 0
    var minValue = Int.max
    var answer = [0, 0]
    
    while end < gems.count {
        if let _ = gemCountDic[gems[end]] {
            gemCountDic[gems[end]]! += 1
        } else {
            gemCountDic[gems[end]] = 1
        }
        end += 1 // 끝점 증가
        
        if gemCountDic.count == kinds { // 현재 구간 내 보석 종류가 전체 종류와 같다면
            while start < end { // start를 end와 같을 때까지 증가시킴
                if gemCountDic[gems[start]]! > 1 { // start에 해당하는 보석이 구간 내에 하나 이상 있으면
                    gemCountDic[gems[start]]! -= 1 // 해당 보석 하나 감소 (start 포인터 증가시키니까)
                    start += 1
                } else { // 1개밖에 없을 때는 start를 증가시키면 안되므로, minValue랑 크기 비교 후 종료
                    if minValue > end - start {
                        minValue = end - start
                        answer = [start + 1, end]
                    }
                    break
                }
            }
        }
    }
    
    return answer
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["xyz", "xyz", "xyz"]))
