import Foundation

func sliceString(_ str: String) -> [String] {
    let str = str.lowercased()
    var arr: [String] = []
    
    for i in 1..<str.count {
        let preIndex = str.index(str.startIndex, offsetBy: i - 1)
        let index = str.index(str.startIndex, offsetBy: i)
        let slice = String(str[preIndex...index])
        
        var flag = true
        for s in slice {
            if !s.isLetter {
                flag = false
            }
        }
        
        if flag {
            arr.append(slice)
        }
    }
    
    return arr
}

func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = sliceString(str1)
    var str2 = sliceString(str2)
    
    var a = 0
    for str in str1 {
        if str2.contains(str) {
            a += 1
            str2.remove(at: str2.firstIndex(of: str)!)
        }
    }
    
    let b = (str1 + str2).count
    
    if a == 0 && b == 0 {
        return 65536
    }
    
    return Int(floor(Double(a)/Double(b) * 65536))
}
