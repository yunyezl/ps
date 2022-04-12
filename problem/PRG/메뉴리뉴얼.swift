import Foundation

// var all: [String] = []

// func combination(_ target:[String], _ target_num: Int, _ index: Int,_ tmp: String) {
//     if tmp.count == target_num {
//         all.append(tmp.sorted().map { String($0) }.joined())
//         return
//     }
    
//     for i in index..<target.count{
//         combination(target, target_num, i+1, tmp + target[i])
//     }
// }

// func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
//     let maxOrdersCount = orders.max {
//         $0.count < $1.count
//     }!.count
    
//     let filterCourse = course.filter {
//         $0 <= maxOrdersCount
//     }
    
//     var answer: [String] = []
//     var menuSet: [String: Int] = [:]
    
//     for i in 0..<filterCourse.count {
//         for j in 0..<orders.count {
//             combination(Array(orders[j]).map { String($0) }, filterCourse[i], 0, "")
//             for menu in all {
//                 if menuSet.keys.contains(menu) {
//                     menuSet[menu]! += 1
//                 } else {
//                     menuSet[menu] = 1
//                 }
//             }
//             all = []
//         }
//     }
    
//     for i in filterCourse {
//         let sortedMenu = menuSet.filter {
//             $0.key.count == i
//         }.sorted {
//             $0.value > $1.value
//         }
//         if sortedMenu.first!.value < 2 {
//             continue
//         } else {
//             let maxValue = sortedMenu.first?.value
//             answer.append(contentsOf: sortedMenu.filter {
//                 $0.value == maxValue
//             }.map {
//                 $0.key
//             })
//         }
//     }
    
//     return answer.sorted()
// }

// 220412 (화) 풀이

import Foundation

// 각 orders에서 course 개수만큼 조합 뽑아서 딕셔너리에 값 저장하기

func combination(_ targetNum: Int,
                 _ index: Int, 
                 _ target: [String], 
                 _ tmp: [String], 
                 _ allCase: inout [String: Int]) {
    if tmp.count == targetNum {
        let course = tmp.sorted().joined(separator: "")
        if let _ = allCase[course] {
            allCase[course]! += 1
        } else {
            allCase[course] = 1
        }
        return
    }
    
    for i in index..<target.count {
        combination(targetNum, i + 1, target, tmp + [target[i]], &allCase)
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var allCase: [String: Int] = [:]
    for order in orders {
        for count in course.filter({ $0 <= order.count }) {
            combination(count, 0, Array(order).map { String($0) }, [], &allCase)
        }
    }

    var answer: [String] = []
    for count in course {
        let l = allCase.filter({ return $0.key.count == count && $0.value >= 2 })
        let maxValue = l.values.max() ?? 2
        answer += l.filter({ $0.value >= maxValue }).keys
    }

    return answer.sorted()
}
