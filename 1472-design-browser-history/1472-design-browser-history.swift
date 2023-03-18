class BrowserHistory {
    var history: [String]
    var currentPosition: Int

    init(_ homepage: String) {
        self.history = [homepage]
        self.currentPosition = 0
    }

    func visit(_ url: String) {
        self.history.removeSubrange(currentPosition+1..<history.count)
        self.history.append(url)
        self.currentPosition += 1
    }

    func back(_ steps: Int) -> String {
        self.currentPosition = max(0, currentPosition - steps)
        return history[currentPosition]
    }

    func forward(_ steps: Int) -> String {
        self.currentPosition = min(history.count - 1, currentPosition + steps)
        return history[currentPosition]
    }
}





