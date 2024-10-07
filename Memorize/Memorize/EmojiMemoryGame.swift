//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chelsea Calvo on 9/27/24.
//
//- Why use a class instead of a struct here?
//  Our View Model is part of the UI , it has to be because its packaging up whats going on in the model. It isnt creating views and such but thats why we immport swiftui , it needs to know!
//- what is a super class?
//  Remember that classes are reference types rather than strcut that are value types!
//- what are access codes? what is private var? (private means that the only code that can use this var and use it, is private to where it is)
//- what is closure syntax?
//- what is static vars and funcitons? how can they relate to private??
//- what is namespace?
//- why are global variables bad?


import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👻","🎃","🕷️","⚰️","🧟‍♂️","🍬", "🍭", "💀", "🧛‍♂️", "🧙‍♀️", "🕸️", "👽"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    
    // the view is accessing whats below not above bc everything is private!
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.chose(card)
    }
}


