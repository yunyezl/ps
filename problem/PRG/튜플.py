def replace(s):
    return list(map(int, s.replace("}", "").replace("{", "").split(",")))

def solution(s):
    answer = []
    s = sorted(s[1:-1].split("},{"), key=lambda x: len(x))
    for l in list(map(replace, s)):
        for num in l:
            if num not in answer:
                answer.append(num)
                break
    return answer
