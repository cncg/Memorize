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
//


import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","⚰️","🧟‍♂️","🍬", "🍭", "💀", "🧛‍♂️", "🧙‍♀️", "🕸️", "👽"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards : some View {
        HStack {
            ForEach(0..<cardCount,id: \.self) { index in        // need more learning
                CardView(content: emojis[index])
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
    }
  
    var cardRemover : some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder : some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
}

struct CardView: View {
    let content : String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}



#Preview {
    ContentView()
}
