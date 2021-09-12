func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var release_day: [Int] = Array(repeating: 0, count: progresses.count)
    
    for i in 0..<progresses.count {
        let remain_percent = 100 - progresses[i]
        let day = remain_percent / speeds[i]
        release_day[i] = remain_percent % speeds[i] == 0 ? day : day + 1
    }
    
    var answer: [Int] = []
    
    var base = release_day[0]
    var cnt = 0
    for day in release_day {
        if day <= base {
            cnt += 1
        } else {
            answer.append(cnt)
            cnt = 1
            base = day
        }
    }
    answer.append(cnt)
    
    return answer
}
