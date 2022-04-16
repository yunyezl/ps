import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var waitingPeoples: [Int] = timetable.map({
        let info = $0.split(separator: ":").map { Int(String($0))! }
        let hour = info[0]
        let minute = info[1]
        return hour * 60 + minute
    }).sorted()
    
    var busTime = 9 * 60
    var remaining = n
    var answer = 0

    while remaining != 0 {
        var riders: [Int] = []
        for arriveTime in waitingPeoples {
            if riders.count == m {
                break
            }
            if arriveTime <= busTime {
                riders.append(arriveTime)
            }
        }
        
        if riders.count >= waitingPeoples.count {
            waitingPeoples = []
        } else {
            waitingPeoples = waitingPeoples[riders.count...waitingPeoples.count-1].map { Int($0) }
        }
        
        remaining -= 1
        if remaining == 0 {
            if riders.count >= m {
                if let laterTime = riders.max() {
                    answer = laterTime - 1
                }
            } else {
                answer = busTime
            }
        }
        busTime += t
    }
    
    return String(format: "%02d:%02d", answer / 60, answer % 60)
}
