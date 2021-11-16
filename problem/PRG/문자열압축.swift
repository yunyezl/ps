import Foundation

func compress(_ compress: inout String, _ cnt: Int, _ standard: Substring) {
    if cnt > 1 {
        compress += String(cnt) + standard
    } else {
        compress += standard
    }
}

func solution(_ s:String) -> Int {
    var allLength: [Int] = []
    
    for sliceIndex in 1..<s.count / 2 + 1 {
        var arr: [Substring] = []
        for i in stride(from: 0, to: s.count, by: sliceIndex) {
            let start = s.index(s.startIndex, offsetBy: i)
            if i + sliceIndex > s.count - 1 {
                let end = s.endIndex
                arr += [s[start..<end]]
            } else {
                let end = s.index(s.startIndex, offsetBy: i + sliceIndex)
                arr += [s[start..<end]]
            }
        }
        var prefix = 1
        var standard = arr[0]
        var compressdString = ""

        for j in 1..<arr.count {
            if standard == arr[j] {
                prefix += 1
            } else {
                compress(&compressdString, prefix, standard)
                standard = arr[j]
                prefix = 1
            }
        }
        compress(&compressdString, prefix, standard)
        allLength.append(compressdString.count)
    }
    
    if allLength.count > 1 {
        return allLength.min()!
    } else {
        return 1
    }
}

