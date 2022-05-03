def solution(gems):
    answer = []
    N = len(gems)
    kind = len(set(gems))
    s, e = 0, 0
    dic = {gems[0]:1,}
    length = int(1e9)
    while s < N and e < N:
        if len(dic) < kind:
            e += 1
            if e == N:
                break
            dic[gems[e]] = dic.get(gems[e], 0) + 1
        else:
            if e - s < length:
                length = e - s
                answer = [s + 1, e + 1]
            if dic[gems[s]] == 1:
                del dic[gems[s]]
            else:
                dic[gems[s]] -= 1
            s += 1
    return answer
