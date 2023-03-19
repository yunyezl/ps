class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isLeaf = false
}

class WordDictionary {
    let root = TrieNode()

    func addWord(_ word: String) {
        var node = root
        for char in word {
            if let child = node.children[char] {
                node = child
            } else {
                let newChild = TrieNode()
                node.children[char] = newChild
                node = newChild
            }
        }
        node.isLeaf = true
    }

    func search(_ word: String) -> Bool {
        return searchWord(Array(word), 0, root)
    }

    private func searchWord(_ word: [Character], _ index: Int, _ node: TrieNode) -> Bool {
        if index == word.count {
            return node.isLeaf
        }
        let char = word[index]
        if char == "." {
            for child in node.children.values {
                if searchWord(word, index + 1, child) {
                    return true
                }
            }
            return false
        }
        guard let child = node.children[char] else {
            return false
        }
        return searchWord(word, index + 1, child)
    }
}
