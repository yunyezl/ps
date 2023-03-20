class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var count = 0
        var flowerbed = flowerbed
        
        if n == 0 {
            return true
        }
        
        if flowerbed.count == 1 {
            if n == 1 && flowerbed[0] == 0 {
                return true
            }
            return false
        }
        
        for (index, space) in flowerbed.enumerated() {
            if space == 0 {
                if index == 0 {
                    if flowerbed[index + 1] == 0 {
                        count += 1
                        flowerbed[index] = 1
                    }
                } else if index == flowerbed.count - 1 {
                    if flowerbed[index - 1] == 0 {
                        count += 1
                        flowerbed[index] = 1
                    }
                } else {
                    if flowerbed[index - 1] == 0 && flowerbed[index + 1] == 0 {
                        count += 1
                        flowerbed[index] = 1
                    }
                }
            }
            
            if count == n {
                return true
            }
        }
        return false
    }
}
