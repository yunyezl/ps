func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var answer: [Int] = []
    
    var list: [String: [(index: Int, playCount: Int)]] = [:]
    _ = zip(genres, plays).enumerated().map({ index, element in
        let (genre, playCount) = element
        if let _ = list[element.0] {
            list[genre]!.append((index, playCount))
        } else {
            list[genre] = [(index, playCount)]
        }
    })
    
    let genreRanking = list.map { key, value in
        (key, value.map { $0.playCount }.reduce(0, +))
    }.sorted {
        $0.1 > $1.1
    }.map { genres, totalPlay in
        genres
    }

    for genre in genreRanking {
        var playInfo = list[genre]!.sorted {
            if $0.playCount == $1.playCount {
                return $0.index < $1.index
            }
            return $0.playCount > $1.playCount
        }
        
        if playInfo.count >= 2 {
            playInfo = Array(playInfo[0..<2])
        }
        
        playInfo.forEach { playInfo in
            answer.append(playInfo.index)
        }
    }

    return answer
}
