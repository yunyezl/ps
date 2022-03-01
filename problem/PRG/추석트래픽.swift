import Foundation

struct Log {
    let startTime: Int
    let endTime: Int
}

func logWithStartTime(_ lines: [String]) -> [Log] {
    return lines.map({ line -> Log in
        var sLine = line.components(separatedBy: " ")
        sLine[2].removeLast()
        
        let end = sLine[1].components(separatedBy: ".")
        let hhmmss = end[0].components(separatedBy: ":")
        let sss = Int(end[1])!
        
        let endTime = (Int(hhmmss[0])! * 3600
                       + Int(hhmmss[1])! * 60
                       + Int(hhmmss[2])!
                      ) * 1000 + sss
        let duration = Int(Double(sLine[2])! * 1000)
        return Log(startTime: endTime - duration + 1, endTime: endTime)
    })
}

func solution(_ lines:[String]) -> Int {
    let logs = logWithStartTime(lines)
    
    var maxCount = 0
    for i in 0..<logs.count {
        var count = 1
        let end = logs[i].endTime
        for j in i+1..<logs.count {
            if logs[j].startTime < end + 1000 {
                count += 1
            }
        }
        maxCount = max(maxCount, count)
    }
    
    return maxCount
}
