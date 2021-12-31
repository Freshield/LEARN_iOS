//
//  EmojiMemoryGameView.swift
//  memory
//
//  Created by Yang Yu on 2021/5/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                    Text(card.content)
                } else {
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: 10.0).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(geometry.size)))
        }
    }
        
    // MARK: - Drawing Content
        let cornerRadius: CGFloat = 10.0
        let edgeLineWidth: CGFloat = 3.0
        func fontSize(_ size: CGSize) -> CGFloat {
            min(size.height, size.width) * 0.75
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
