//  Created by cncg on 8/14/24.
//  ContentView.swift
//  Stanford Memorize App
//
// NOTES TO TRANSFER TO NOTEBOOK 9/11/2024 - DAY THREE
//- What is trailing closure syntax?
//- What is trailing and leading?
//  The default of certain things is important for example the RoundedRectangle natrually is .fill unless stated otherwise. Or alignment being .center for the VStack. Try to remember you need to guide your code. Some things are default!
//  Any Struct that has a variable, the var MUST have a value.
//  You can make local variables inside of Views
//- What are structs ? What are considered structs?
//  let = constant , var = variable can change
//  Make sure to use things in the ViewBuilder witht he right let or var, if things are going to change, use var. Use let and then see what needs to be changed or remember . The isFaceUp needs to be changed and not let for example. This value will change and is not constant.
//- What is Type inference? Once a type is set it cannot be changed later! Big change from Javascript.
//  OPTION _ CLICK = what does this do? show types?
//  What is @Sate ? Is this permanent or temporary?
//  Views are Immutable . What does that mean?
//- Arrays in swift, how to make them ? setting a type?
//  ARRAYS START AT 0! index number 0 is the start, the number one, the first.
//- What is alternate array notation?
//  PRACTICE DRY. DONT REPEAT YOURSELF. REPEATED CODE? FIX IT !
//- What is ForEach? And how does the RANGE of integers or sequence work?
//
//



import SwiftUI



struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","☠️"]
    
    var body: some View {
        HStack {
            ForEach(0..<4,id: \.self) { index in
                CardView(content: emojis[index])        // what happens if you change this to 2?
            }
//            CardView(content: emojis[0], isFaceUp: true)
//            CardView(content: emojis[1], isFaceUp: true)
//            CardView(content: emojis[2], isFaceUp: true)
//            CardView(content: emojis[3], isFaceUp: true)
//   this needs a loop instead. this is repeated code. now we use the ForEach
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content : String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)     // using the constant instead of repeating roundedrectangle
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
