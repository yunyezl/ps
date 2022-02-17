import Foundation

// fees: 기본 시간(분), 기본 요금, 단위 시간(분),  단위 요금(원)
// 기본 시간을 넘어가면 기본 요금 + (누적시간 - 기본 시간) / 단위시간 * 단위요금

func calculateTime(_ outTime: [Int], _ inTime: [Int]) -> Int {
    let (outHour, outMin) = (outTime[0], outTime[1])
    let (inHour, inMin) = (inTime[0], inTime[1])
    let diffMinute = outMin - inMin < 0 ? outMin - inMin + 60 : outMin - inMin
    let diffHour = outMin - inMin < 0 ? outHour - inHour - 1 : outHour - inHour
    return diffHour * 60 + diffMinute
}

func calculateFee(_ totalParkingTime: Double,
                  _ defaultTime: Double, 
                  _ defaultMoney: Int,
                  _ unitTime: Double, 
                  _ unitMoney: Int) -> Int {
    if totalParkingTime > defaultTime {
        return defaultMoney + Int(ceil((totalParkingTime - defaultTime) / unitTime)) * unitMoney
    } 
    return defaultMoney
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var recordsDic: [String: [String]] = [:]
    var timeDic: [String: Int] = [:]

    for record in records {
        let carInfo = record.split(separator: " ").map { String($0) }
        if recordsDic[carInfo[1]] == nil {
            recordsDic[carInfo[1]] = [carInfo[0]]
            timeDic[carInfo[1]] = 0
        } else {
            recordsDic[carInfo[1]]!.append(carInfo[0])
        }
    }

    for (key, value) in recordsDic {
        var value = value
        if value.count % 2 != 0 {
            value.append("23:59")
        }
        for i in stride(from: 1, to: value.count, by: 2) {
            let outTime = value[i].split(separator: ":").map { Int(String($0))! }
            let inTime = value[i-1].split(separator: ":").map { Int(String($0))! }
            timeDic[key]! += calculateTime(outTime, inTime)
        }
    }

    var feeDic: [String: Int] = [:]
    for (key, time) in timeDic {
        feeDic[key] = calculateFee(Double(time), Double(fees[0]), fees[1], Double(fees[2]), fees[3])
    }
    
    return feeDic.sorted(by: <).map { $0.1 }
}

// 출차 - 입차 간격 구하기
// 출차 minute이 입차 minute 보다 크다면 그냥 빼주고, 작다면 시간에서 1 빼고 (60+출차minute) - 입차minute

// [차량번호: []] 0번째 인덱스가 입차시간, 1번째 인덱스가 출차 시간
// 출차할 경우 배열 초기화
// 차량 번호가 작은 자동차부터 청구할 주차 요금
