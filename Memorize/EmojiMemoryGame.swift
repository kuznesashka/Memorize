//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleksandra Kuznetsova on 03.11.2021.
//

import SwiftUI

class EmojiMemoryGame{
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4)
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
