def solution(jobs):
    answer = []
    waitedJobs = []
    requestedJobs = [[] for _ in range(300001)]
    for job in jobs:
        requestedJobs[job[0]].append(job[1])
    jobs.sort(key=lambda x: x[0])
    
    time = jobs[0][0]
    for job in requestedJobs[time]: 
        heapq.heappush(waitedJobs, [job,  time])
    processingWork = heapq.heappop(waitedJobs)
    done = 0

    while True:
        time += 1
        processingWork[0] -= 1
        for job in requestedJobs[time]: # 요청 들어오면 waitingList에 넣기
            heapq.heappush(waitedJobs, [job,  time])
        if processingWork[0] <= 0: # 진행중인 작업이 끝났을 경우, 가장 짧게 소요되는 작업 뽑아오기
            if processingWork[0] == 0:
                answer.append([processingWork[1], time])
                done += 1
            if done == len(jobs):
                break
            if waitedJobs:
                processingWork = heapq.heappop(waitedJobs)
        
    result = 0
    for a in answer:
        result += a[1] - a[0]
        
    return result // len(jobs)
