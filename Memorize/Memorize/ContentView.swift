//  Created by cncg on 8/14/24.
//  ContentView.swift
//  Stanford Memorize App
//
// NOTES TO TRANSFER TO NOTEBOOK 9/11/2024 - DAY THREE
//- What is trailing closure syntax?
//- What is trailing and leading?
//- What kinds of logic can Views not do?
//- What are structs ? What are considered structs?
//  Make sure to use things in the ViewBuilder witht he right let or var, if things are going to change, use var. Use let and then see what needs to be changed or remember . The isFaceUp needs to be changed and not let for example. This value will change and is not constant.
//- What is Type inference? Once a type is set it cannot be changed later! Big change from Javascript.
//  OPTION _ CLICK = what does this do? show types?
//  What is @Sate ? Is this permanent or temporary?
//-  Views are Immutable . What does that mean?
//- Arrays in swift, how to make them ? setting a type?
//  ARRAYS START AT 0! index number 0 is the start, the number one, the first.
//- What is alternate array notation?
//  PRACTICE DRY. DONT REPEAT YOURSELF. REPEATED CODE? FIX IT !
//- What is ForEach? And how does the RANGE of integers or sequence work? Is this a tradional for loop?
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
//


import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","⚰️","🧟‍♂️","🍬", "🍭", "💀", "🧛‍♂️", "🧙‍♀️", "🕸️", "👽"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum:120))]) {
            ForEach(0..<cardCount,id: \.self) { index in        // need more learning
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover : some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder : some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content : String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}



#Preview {
    ContentView()
}
