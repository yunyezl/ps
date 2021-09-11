func find_parent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find_parent(parent[x])
    }
    return parent[x]
}

func union_parent (_ a: Int, _ b: Int) {
    let a = find_parent(a)
    let b = find_parent(b)
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

/// 노드의 개수와 간선(union) 연산의 개수 입력 받기
let v = Int(readLine()!)!
let e = Int(readLine()!)!

var parent = Array(repeating: 0, count: v + 1)

/// 부모 테이블 상에서, 부모를 자기 자신으로 초기화
for i in 1..<v+1 {
    parent[i] = i
}

/// union 연산을 e번 만큼 수행
for _ in 0..<e {
    let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
    let a = input[0]
    let b = input[1]
    union_parent(a, b)
}

var count = -1
for i in 1..<v+1 {
    if find_parent(i) == 1 {
        count += 1
    }
}

print(count)
