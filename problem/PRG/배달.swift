import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    let startNode = 1
    // 각 노드에 연결되어 있는 노드에 대한 정보를 담는 리스트
    
    var graph: [[(Int, Int)]] = Array(repeating: [], count: N + 1)
    var distance = Array(repeating: Int.max, count: N + 1)
    distance[startNode] = 0
    
    for i in 0..<road.count {
        // road[i][0]번 노드에서 road[i][1]번 노드로 가는 비용이 road[i][2]
        graph[road[i][0]].append((road[i][1], road[i][2]))
        graph[road[i][1]].append((road[i][0], road[i][2]))
    }
    
    var pq = [(0, startNode)]
    
    while !pq.isEmpty {
        pq.sort { $0.0 > $1.0  }
        let (dist, now) = pq.removeLast()
        if distance[now] < dist {
            continue
        }
        for (adj, weight) in graph[now] {
            var cost = dist + weight
            if cost < distance[adj] {
                distance[adj] = cost
                pq.append((cost, adj))
            }
        }
    }

    return distance.filter {
        $0 <= k
    }.count
}
