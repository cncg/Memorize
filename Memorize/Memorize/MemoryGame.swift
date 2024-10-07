//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Chelsea Calvo on 9/27/24.
//
//  Models are UI independent and should not have any SwiftUI or any UI really. Thiss will be the logic of our game
//- What are Generics in Swift? (a dont care as the professor says) LOOK INTO THIS
//- Why is memorize.card here?
//- What goes in this code? Is this the model holding logic?
//  Remember that structs are value types, rather than classes that are reference types!
//- What are type paramaters ?
//- What are protocols? ( it is a description , a description of behavior , no implemenation sort of contracts between objects)
//- access control, what is it?
//- what is private and private(set)
//- what are for loops and what do they look like in swift ?
//  for in
//- what is underbar in swift and what is usually used for ?
//- how can you use functions as types?


import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func chose(_ card: Card) {
        //logic for choosing a card
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
