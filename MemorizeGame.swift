//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Aleksandra Kuznetsova on 03.11.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int) {
        cards = Array<Card>()
        for _ in 0..<numberOfPairsOfCards {
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
