//  Created by cncg on 8/14/24.
//  ContentView.swift
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


import SwiftUI


// now fix the toggle, you fucked the code up you had and what you did is gone! great work ! now we are using the code the professor used. you didnt have the adder and remvoer at te bottom of the screen and the cards didnt have an aspect ratio. now oyu need to add the card toggle, to isfaceup. fix it

struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","⚰️","🧟‍♂️","🍬", "🍭", "💀", "🧛‍♂️", "🧙‍♀️", "🕸️", "👽"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        ScrollView {
            cards
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum:125))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.strokeBorder(lineWidth: 2)
            Text(content).font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
