class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var answer = 0
        var zeroCount = 0

        for num in nums {
            if num == 0 {
                zeroCount += 1
            } else {
                answer += zeroCount * (zeroCount + 1) / 2
                zeroCount = 0
            }
        }

        answer += zeroCount * (zeroCount + 1) / 2

        return answer
    }
}
