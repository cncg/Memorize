//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Chelsea Calvo on 9/27/24.
//
//  Models are UI independent and should not have any SwiftUi or any UI really. Thiss will be the logic of our game
//-  What are Generics in Swift? (a dont care as the professor says)

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    var score : Int
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

//
//var cardCountAdjusters: some View {
//    HStack {
//        cardRemover
//        Spacer()
//        cardAdder
//    }
//    .imageScale(.large)
//    .font(.largeTitle)
//}
//
//func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//    Button(action: {
//        cardCount += offset
//    }) {
//        Image(systemName: symbol)
//    }
//    .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//}
//
//var cardRemover: some View {
//    cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//}
//
//var cardAdder: some View {
//    cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//}
