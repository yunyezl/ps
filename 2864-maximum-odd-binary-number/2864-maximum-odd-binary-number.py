class Solution(object):
    def maximumOddBinaryNumber(self, s):
        s = [c for c in s]
        left = 0
        for i in range(len(s)):
            if s[i] == "1":
                s[left], s[i] = s[i], s[left]
                left += 1
        s[left - 1], s[len(s) - 1] = s[len(s) - 1], s[left - 1]
        
        return "".join(s)
