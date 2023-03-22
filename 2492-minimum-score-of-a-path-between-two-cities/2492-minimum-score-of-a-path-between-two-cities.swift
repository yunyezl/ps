class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var route = [Int](repeating: 0, count: n + 1)
        var answer = [Int](repeating: Int.max, count: n + 1)
        
        for i in 0...n {
            route[i] = i
        }
        
        for i in 0..<roads.count {
            let start = find(roads[i][0], route)
            let end = find(roads[i][1], route)
            route[start] = route[end]
            answer[start] = min(roads[i][2], min(answer[start], answer[end]))
            answer[end] = min(roads[i][2], min(answer[start], answer[end]))
        }
        
        return answer[find(1, route)]
    }
    
    func find(_ i: Int, _ route: [Int]) -> Int {
        return route[i] == i ? i : find(route[i], route)
    }   
}