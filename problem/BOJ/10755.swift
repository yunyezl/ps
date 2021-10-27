import Foundation

var g = Int(readLine()!)!
var p = Int(readLine()!)!

var parent = Array(repeating: 0, count: g + 1)

for i in 1..<g+1 {
    parent[i] = i
}

func find_parent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find_parent(parent[x])
    }
    return parent[x]
}

func union_parent(_ a: Int, _ b: Int) {
    let a = find_parent(a)
    let b = find_parent(b)
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

var array: [Int] = []
for i in 0..<p {
    array.append(Int(readLine()!)!)
}

var result = 0
for i in array {
    let i = find_parent(i)
    if i == 0 { /// 더 이상 탑승할 수 있는 탑승구가 없을 때
        break
    }
    union_parent(i, i - 1)
    result += 1
}

print(result)

