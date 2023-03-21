class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var answer = 0
        var zeroCount = 0

        for num in nums {
            if num == 0 {
                zeroCount += 1
                answer += zeroCount
            } else {
                zeroCount = 0
            }
        }

        return answer
    }
}