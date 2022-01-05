import Foundation

func solution(_ relation:[[String]]) -> Int {

    let rowLength = relation.count
    let colLength = relation[0].count

    var visited: [Bool] = Array(repeating: false, count: colLength + 1)
    var array: [Int] = Array(repeating: 0, count: colLength)
    var allCase: [[Int]] = []

    func combination(cnt: Int, target: Int, array: inout [Int]) {
        if cnt == target {
            allCase.append(array)
            return
        }

        for i in 1...colLength {
            if !visited[i] {
                visited[i] = true
                array[cnt] = i - 1
                combination(cnt: cnt + 1, target: target, array: &array)
                visited[i] = false
            }
        }
    }

    for i in 1...colLength {
        array = Array(repeating: 0, count: i)
        combination(cnt: 0, target: i, array: &array)
    }

    func isUnique(_ a: [Int]) -> Bool {
        var joinedArray: [String] = []
        for each in relation {
            var temp: [String] = []
            for i in a {
                temp.append(each[i])
            }
            joinedArray.append(temp.joined())
        }
        if joinedArray.count == Set(joinedArray).count {
            return true
        }
        return false
    }

    var candidateKey: [[Int]] = []

    func isMinimum(_ a: [Int]) -> Bool 
        for key in candidateKey {
            if Set(key).isSubset(of: a) {
                return false
            }
        }
        return true
    }

    for c in allCase {
        if isUnique(c) {
            if isMinimum(c) {
                candidateKey.append(c)
            }
        }
    }

    return candidateKey.count
}

/* 비트마스킹을 이용한 풀이 */

import Foundation

func solution(_ relation:[[String]]) -> Int {
    let rowSize = relation.count
    let colSize = relation[0].count

    var resultSet = Set<Int>()
    print(1 << colSize)
    
    
    for bit in 1..<(1 << colSize) {
        var combiSet = Set<String>()
        var isUnique = true

        for r in 0..<rowSize {
            var tmpStr = ""
            
            for c in 0..<colSize where (bit & (1 << c)) != 0 {
                tmpStr += relation[r][c]
            }
            
            if combiSet.update(with: tmpStr) != nil { // set내에 중복 요소 존재
                isUnique = false
                break
            }
        }

        if isUnique && resultSet.filter{ ($0 & bit) == $0 }.isEmpty {
            resultSet.insert(bit)
        }
    }

    return resultSet.count
}
