from itertools import permutations
import re

def solution(expression):
    maxValue = 0
    for ex in permutations(["-", "*", "+"], 3):
        numbers = [int(number) for number in re.findall('[0-9]+', expression)]
        operators = re.findall('[\W]+', expression)
        for e in ex:
            while True:
                if operators.count(e) == 0:
                    break
                num1 = operators.index(e)
                operators.pop(num1)
                num2 = num1 + 1
                if e == "-":
                    answer = numbers[num1] - numbers[num2]
                elif e == "*":
                    answer = numbers[num1] * numbers[num2]
                elif e == "+":
                    answer = numbers[num1] + numbers[num2]
                numbers[num1] = answer
                numbers.pop(num2)
        if maxValue < abs(numbers[-1]):
            maxValue = abs(numbers[-1])
    return maxValue
  
print(solution("100-200*300-500+20"))
