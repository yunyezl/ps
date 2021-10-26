//import Foundation
// 메모리초과 코드
//func find_parent(_ x: Int) -> Int {
//    if parent[x] != x {
//        parent[x] = find_parent(parent[x])
//    }
//    return parent[x]
//}
//
//func union_parent(_ a: Int, _ b: Int) {
//    let a = find_parent(a)
//    let b = find_parent(b)
//    if a < b {
//        parent[b] = a
//    } else {
//        parent[a] = b
//    }
//}
//
//func getDistance(_ points: [(Int, Int, Int)], _ i: Int, _ j: Int) -> Int {
//    return min(abs(points[i].0 - points[j].0), abs(points[i].1 - points[j].1), abs(points[i].2 - points[j].2))
//}
//
//let n = Int(readLine()!)!
//
//var points: [(Int, Int, Int)] = []
//for i in 0..<n {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    points.append((input[0], input[1], input[2]))
//}
//
//var edges: [(Int, Int, Int)] = []
//
//for i in 0..<n {
//    for j in i + 1..<n {
//        let distance = getDistance(points, i, j)
//        edges.append((distance, i + 1, j + 1))
//    }
//}
//
//edges.sort {
//    $0.0 < $1.0
//}
//
//var parent = Array(repeating: 0, count: n + 1)
//for i in 1..<n + 1 {
//    parent[i] = i
//}
//
//var result = 0
//for edge in edges {
//    let (cost, a, b) = edge
//    if find_parent(a) != find_parent(b) {
//        union_parent(a, b)
//        result += cost
//    }
//}
//
//print(result)

import Foundation

func find_parent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find_parent(parent[x])
    }
    return parent[x]
}

func union_parent(_ a: Int, _ b: Int) {
    let a = find_parent(a)
    let b = find_parent(b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }


let n = Int(readLine()!)!

var x: [(Int, Int)] = []
var y: [(Int, Int)] = []
var z: [(Int, Int)] = []
var parent = Array(repeating: 0, count: n + 1)

for i in 1..<n+1 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    x.append((input[0], i))
    y.append((input[1], i))
    z.append((input[2], i))
    parent[i] = i
}

x.sort(by: { $0.0 < $1.0 })
y.sort(by: { $0.0 < $1.0 })
z.sort(by: { $0.0 < $1.0 })

var edges: [(Int, Int, Int)] = []

print(x)
print(y)
print(z)

for i in 0..<n-1 {
    edges.append((x[i+1].0 - x[i].0, x[i+1].1, x[i].1))
    edges.append((y[i+1].0 - y[i].0, y[i+1].1, y[i].1))
    edges.append((z[i+1].0 - z[i].0, z[i+1].1, z[i].1))
}

edges.sort(by: { $0.0 < $1.0 })

print(edges)

var result = 0
for edge in edges {
    let (cost, a, b) = edge
    if find_parent(a) != find_parent(b) {
        union_parent(a, b)
        result += cost
    }
}

print(result)

//
//[(0, 2, 1),
// (0, 5, 4), 
// (1, 1, 4),
// (1, 4, 2),
// (3, 2, 1),
// (3, 3, 5),
// (4, 4, 3),
// (5, 5, 2),
// (10, 2, 1),
// (10, 3, 2),
// (11, 4, 3),
// (20, 5, 4)] x
