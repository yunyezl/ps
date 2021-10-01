import Foundation

let n = Int(readLine()!)!
var houseList: [Int] = []

var graph = [[Int]]()
for _ in 0..<n {
    graph.append(Array(readLine()!).map { Int(String($0))! })
}

@discardableResult
func dfs(_ x: Int, _ y: Int) -> Bool {
    if x <= -1 || x >= n || y <= -1 || y >= n {
        return false
    }
    
    if graph[x][y] == 1 {
        graph[x][y] = 0
        house += 1
        dfs(x - 1, y)
        dfs(x, y - 1)
        dfs(x + 1, y)
        dfs(x, y + 1)
        return true
    }
    
    return false
}


var group = 0
var house = 0
for i in 0..<n {
    for j in 0..<n {
        if dfs(i, j) {
            group += 1
            houseList.append(house)
            house = 0
        }
    }
}

print(group)
houseList.sorted().forEach { house in
    print(house)
}
