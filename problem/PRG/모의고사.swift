import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let one = [1, 2, 3, 4, 5]
    let two = [2, 1, 2, 3, 2, 4, 2, 5]
    let three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5,]
    
    var answers = answers

    var peoples = Array(repeating: 0, count: 3)
    for i in 0..<answers.count {
        if answers[i] == one[i % one.count] {
            peoples[0] += 1
        }
        if answers[i] == two[i % two.count] {
            peoples[1] += 1
        }
        if answers[i] == three[i % three.count] {
            peoples[2] += 1
        }
    }
    
    let maxValue = peoples.max()!
    
    return peoples.enumerated().filter({ $0.element == maxValue }).map { $0.offset + 1 }
}
