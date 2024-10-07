//  Created by cncg on 8/14/24.
//  EmojiMemoryGameView.swift
//  Stanford Memorize App
//
// NOTES TO TRANSFER TO NOTEBOOK 9/11/2024 - DAY THREE
//- What are structs ? What are considered structs?
//  Make sure to use things in the ViewBuilder with the right let or var, if things are going to change, use var. Use let and then see what needs to be changed or remember . The isFaceUp needs to be changed and not let for example. This value will change and is not constant.
//- What is Type inference? Once a type is set it cannot be changed later! Big change from Javascript.
//  OPTION _ CLICK = what does this do? show types?
//  What is @Sate ? Is this permanent or temp?
//- What does indicies mean?
//- What is the base thing we used in the ZStack?
//  GET USED TO ARRAYS !
//  REMEMBER TO CHECK THINGS BY PRINTING TO CONSOLE JUST LIKE BEFORE! YOU CNA MAKE SUR ECODE WORKS WITH THE CONSOLE
//- What is Image(systemName:) Lookup? Using the plus sign on the top right of the XCode Interface?
//  We added an if statement to stop the app from crashing when removing all cards or adding too many. It crashes without the if statement. Why? Do you understand what is happening?
//- What is implicit return?
//- Internal vs External parameter names
//- What is opacity ? Why change the if else in ViewBuilder to do opacity instead. Changing the isFaceUp form an if else is because when using the if statement, if the card was face down, it would completly change the state of thhe card and there would be no emoji in the content anymore; shrinking the card to nothing. when using opacity you can still have the front or back of the card with emoji in tact it will jsut be invisible when toggled, making sure nothing is shrinked.
//- What is Group?
//- What is a LazyVGrid?
//- How can I know when to add logic or a function?
//- what is semantic renaming and refactoring?

import SwiftUI


struct EmojiMemoryGameView: View {
    
    var viewModel : EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum:125))]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
     
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(card.content).font(Font.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct EmojiMemoryGameView_Previews : PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
