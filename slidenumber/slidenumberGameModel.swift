import Foundation

struct slidenumberGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    var moves = 0
    
    struct Card: Equatable, Identifiable {
        var content: CardContent
        var id: String
    }
    
    init(length: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        
        for index in 0..<length {
            cards.append(Card(content: contentFactory(index), id: "\(contentFactory(index))"))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        
        if var found = cards.firstIndex(where: {$0.id == "16"}) {
            if found / 4  == chosenIndex / 4 {
                let distance = found - chosenIndex
                if distance != 0 {
                    let step = distance > 0 ? -1 : 1
                    
                    for _ in 0..<abs(distance) {
                        cards.swapAt(found, found + step)
                        found += step
                    }
                    
                    moves += 1
                }
            } else if found % 4 == chosenIndex % 4 {
                let distance = found - chosenIndex
                if distance != 0 {
                    let step = distance > 0 ? -4 : 4
                    
                    for _ in 0..<abs(distance / 4) {
                        cards.swapAt(found, found + step)
                        found += step
                    }
                    
                    moves += 1
                }
            }
        }
    }
    
    func check() -> Bool {
        let validArray = Array(1...16).map { "\($0)" }
        let compareArray = cards.map { $0.id }
        
        return validArray == compareArray
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index] == card {
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
