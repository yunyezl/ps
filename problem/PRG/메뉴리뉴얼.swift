import Foundation

var all: [String] = []

func combination(_ target:[String], _ target_num: Int, _ index: Int,_ tmp: String) {
    if tmp.count == target_num {
        all.append(tmp.sorted().map { String($0) }.joined())
        return
    }
    
    for i in index..<target.count{
        combination(target, target_num, i+1, tmp + target[i])
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    let maxOrdersCount = orders.max {
        $0.count < $1.count
    }!.count
    
    let filterCourse = course.filter {
        $0 <= maxOrdersCount
    }
    
    var answer: [String] = []
    var menuSet: [String: Int] = [:]
    
    for i in 0..<filterCourse.count {
        for j in 0..<orders.count {
            combination(Array(orders[j]).map { String($0) }, filterCourse[i], 0, "")
            all.sort()
            for menu in all {
                if menuSet.keys.contains(menu) {
                    menuSet[menu]! += 1
                } else {
                    menuSet[menu] = 1
                }
            }
            all = []
        }
    }
    
    for i in filterCourse {
        let sortedMenu = menuSet.filter {
            $0.key.count == i
        }.sorted {
            $0.value > $1.value
        }
        if sortedMenu.first!.value < 2 {
            continue
        } else {
            let maxValue = sortedMenu.first?.value
            answer.append(sortedMenu.first!.key)
            for i in 1..<sortedMenu.count {
                if sortedMenu[i].value == maxValue {
                    answer.append(sortedMenu[i].key)
                } else {
                    break
                }
            }
        }
    }
    
    return answer.sorted()
}
