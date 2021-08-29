//
//  카드 정렬하기.swift
//  CodingTest
//
//  Created by 윤예지 on 2021/08/30.
//

import Foundation

struct Heap<T: Comparable> {
    var list = [T]()
    var comparer : (T,T) -> Bool
    
    init(comparer : @escaping (T,T)->Bool) {
        self.comparer = comparer
    }
    mutating func insert(_ x : T ) {
        var idx = list.count
        list.append(x)
        
        while idx > 0 , comparer(list[(idx-1)/2], list[idx]) {
            list.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
        }
    }
    
    mutating func pop() -> T? {
        if list.isEmpty { return nil }
        list.swapAt(0, list.count-1)
        let willDelete = list.removeLast()
        var idx = 0
        var change = -1
        
        while idx < list.count {
            for i in 2*idx+1...2*idx+2 {
                if i < list.count && comparer(list[idx], list[i]) {
                    if change == -1 {
                        change = i
                    }else {
                        if comparer(list[change], list[i]) {
                            change = i
                        }
                    }
                }
            }
            if change == -1 {break}
            list.swapAt(idx, change)
            idx = change
            change = -1
        }
        return willDelete
    }
    
    var isEmpty : Bool {
        return list.isEmpty
    }
}

let n = Int(readLine()!)!
var cards = Heap<Int>(comparer: >)
for _ in 0..<n {
    cards.insert(Int(readLine()!)!)
}

var sum = 0
var new = 0
while cards.list.count > 1 {
    let one = cards.pop() ?? 0
    let two = cards.pop() ?? 0
    new = one + two
    sum += new
    cards.insert(new)
}

print(sum)
