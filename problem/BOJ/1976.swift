import Foundation

// 양방향

func find_parent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find_parent(parent[x])
    }
    return parent[x]
}

func union_find(_ a: Int, _ b: Int) {
    let a = find_parent(a)
    let b = find_parent(b)
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

let v = Int(readLine()!)!
let e = Int(readLine()!)!

var parent = Array(repeating: 0, count: v + 1)
for i in 1..<v + 1 {
    parent[i] = i
}

for i in 1..<v + 1 {
    let inputArray = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<inputArray.count {
        if inputArray[j] == 1 {
            union_find(i, j + 1)
        }
    }
}

let path = readLine()!.split(separator: " ").map{Int(String($0))!}.map{ parent[$0] }

if path.count == path.filter { $0 == path[0] }.count {
    print("YES")
} else {
    print("NO")
}
