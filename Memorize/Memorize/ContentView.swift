//  Created by cncg on 8/14/24.
//  ContentView.swift
//  Stanford Memorize App
//



import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
        }
        
    }
}

struct CardView:View {
    var body: some View {
        VStack{
            Text("👻")
                .font(.largeTitle)
        }
    }
}






//
//struct ContentView: View {
//    var body: some View {
//        HStack {
//            CardView(isFaceUp: true)
//            CardView()
//            CardView()
//            CardView()
//            CardView()
//        }
//        .foregroundColor(.orange)
//        .padding()
//    }
//}
//
//struct CardView: View {
//    
//    var isFaceUp:Bool = false
//    
//    var body: some View {
//        ZStack (alignment: .center) {
//            if isFaceUp {
//                RoundedRectangle(cornerRadius: 12)
//                    .foregroundColor(.white)
//                RoundedRectangle(cornerRadius: 12)
//                    .strokeBorder(lineWidth: 3)
//                Text("👻")
//                    .font(.largeTitle)
//            } else {
//                RoundedRectangle(cornerRadius: 12)
//            }
//        }
//    }
//}
//
//

#Preview {
    ContentView()
}
