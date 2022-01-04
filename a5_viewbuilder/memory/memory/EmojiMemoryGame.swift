//
//  EmojiMemoryGame.swift
//  memory
//
//  Created by Yang Yu on 2021/5/26.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, CardContentFactory: {pairIndex in emojis[pairIndex]})
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
