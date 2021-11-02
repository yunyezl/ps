import Foundation

func isPrime(_ num: Int) -> Bool {
    for i in 2...num/2 {
        if num % i == 0 {
            return false
        }
    }
    return true
}

var input: [Int] = []
var answer = 0
var result: [Int] = [-1, -1, -1]

func dfs(_ depth: Int, _ index: Int, _ visited: inout [Bool]) {
    if depth == 3 {
        if isPrime(result.reduce(0, +)) {
            answer += 1
        }
        return
    }
    
    if index <= input.count {
        for i in index..<input.count where !visited[i]{
            visited[i] = true
            result[depth] = input[i]
            dfs(depth + 1, i + 1, &visited)
            visited[i] = false
        }
    }
}

func solution(_ nums:[Int]) -> Int {
    var visited = Array(repeating: false, count: nums.count + 1)
    
    input = nums
    dfs(0, 0, &visited)
    
    return answer
}

