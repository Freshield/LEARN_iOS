//
//  MemoryGame.swift
//  memory
//
//  Created by Yang Yu on 2021/5/26.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        // 找到cards中朝上的那张卡
        get { cards.indices.filter { cards[$0].isFaceUp }.only}
        // 设定给定值的那张卡为正面
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        // 如果选择的这张是反着的且没有被匹配过
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // 如果当前有卡为正面
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // 如果选的卡和当前正面的卡内容一致，则两张卡都改为匹配
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // 把当前的卡设为正面
                self.cards[chosenIndex].isFaceUp = true
            } else {
                // 设定选择的卡位正面
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, CardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = CardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            }
        }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

