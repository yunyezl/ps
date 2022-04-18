import heapq

# 시작 지점으로부터 모든 하차지점(1~n)까지의 거리 구하기
# 해당 하차지점으로부터 A, B의 값 구하기 
# (하차지점까지의 거리 + 하차지점으로부터 A까지의 거리) + (하차지점까지의 거리 + 하차지점으로부터 B까지의 거리)
# 그 중에서 최솟값 구하기

def solution(n, s, a, b, fares):
    graph = [[] for i in range(n + 1)]
    distance = [int(1e9)] * (n + 1)
    for fare in fares:
        graph[fare[0]].append((fare[1], fare[2]))
        graph[fare[1]].append((fare[0], fare[2]))
    
    def dijkstra(start):
        q = []
        heapq.heappush(q, (0, start))
        distance[start] = 0
        while q:
            dist, now = heapq.heappop(q)
            if distance[now] < dist:
                continue
            for i in graph[now]:
                cost = dist + i[1]
                if cost < distance[i[0]]:
                    distance[i[0]] = cost
                    heapq.heappush(q, (cost, i[0]))
    dijkstra(s)
    offDistance = distance
    minDistance = int(1e9)
    
    for i in range(1,len(distance)):
        distance = [int(1e9)] * (n + 1)
        dijkstra(i)
        minA = distance[a]
        minB = distance[b]
        dist = minA + minB + offDistance[i]
        if dist < minDistance:
            minDistance = dist

    return minDistance
