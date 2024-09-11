//  Created by cncg on 8/14/24.
//  ContentView.swift
//  Stanford Memorize App
//
// NOTES TO TRANSFER TO NOTEBOOK 9/11/2024 - DAY THREE
// - What is trailing closure syntax?
// - What is trailing and leading?
//  The default of certain things is important for example the RoundedRectangle natrually is .fill unless stated otherwise. Or alignment being .center for the VStack. Try to remember you need to guide your code. Some things are default!
//  Any Struct that has a variable, the var MUST have a value.
//  You can make local variables inside of Views
// - What are structs ? What are considered structs?
//  let = constant , var = variable can change
//  Make sure to use things in the ViewBuilder witht he right let or var, if things are going to change, use var. Use let and then see what needs to be changed or remember . The isFaceUp needs to be changed and not let for example. This value will change and is not constant.
// - What is Type inference? Once a type is set it cannot be changed later! Big change from Javascript.
//  OPTION _ CLICK = what does this do? show types?
//  What is @Sate ? Is this permanent or temporary?
//  Views are Immutable . What does that mean?
//
//
//
//



import SwiftUI



struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)     // using the constant instead of repeating roundedrectangle
                base.strokeBorder(lineWidth: 3)
                Text("👻")
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
