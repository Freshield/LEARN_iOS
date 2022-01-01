//
//  memoryApp.swift
//  memory
//
//  Created by Yang Yu on 2021/5/21.
//

import SwiftUI

@main
struct memoryApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
