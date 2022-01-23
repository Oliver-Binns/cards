public struct Sevens: Game, Codable {
    public private(set) var title: String = "Sevens"
    public private(set) var hands: [[PlayingCard]]
    public private(set) var table: [Suit: Run]
    
    var scores: [Int] {
        hands.map {
            $0.map(SimpleScore().score).reduce(0, +)
        }
    }
    
    public init(players: Int) {
        hands = Deck.noJokers.shuffled().deal(playerCount: players)
        table = Suit.allCases.reduce(into: [:], { $0[$1] = Run() })
    }
}

extension PlayingCard {
    var isSeven: Bool {
        switch self {
        case .suited(.seven, _): return true
        default: return false
        }
    }
}
