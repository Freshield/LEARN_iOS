//
//  memoryApp.swift
//  memory
//
//  Created by Yang Yu on 2021/5/7.
//

import SwiftUI

@main
struct memoryApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
