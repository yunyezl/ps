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
    if a >= b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var parent = Array(repeating: 0, count: n+1)
for i in 0..<m {
    parent[i] = i
}

var ans = ""

for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    if info[0] == 0 {
        union_parent(info[1], info[2])
    } else {
        ans += find_parent(info[1]) == find_parent(info[2]) ? "YES\n" : "NO\n"
    }
}

print(ans.dropLast())
