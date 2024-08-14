//  Created by cncg on 8/14/24.
//  ContentView.swift
//  Memorize App
//
//  NOTES
// IMPORT SWIFTUI - this is importing obviously swiftui, we dont always import this. we always separate the logic and the ui, so we my make new files to import like "foundation" for arrays and such. If we are dealing with UI, then swiftUI. If we    are dealing with object-orient databse we will use Core Data!
// STRUCT CONTENTVIEW: VIEW { - structs in swiftui are structures! They are the building blocks of swiftui, this struct is called ContentView. This colon means that this sturct behaves like a view. The behavior and funciton of this struct, behaves like a view.
// VAR BODY: SOME VIEW - this initializes a variable called body. This is a property of the struct! The value of this variable is not stored somewhere it is computed. The code is getting run over and over when its called. Its still a var, beacuse it may return something new, but it is a computed property of the struct! The property of this varibale has to be some View. It has to conform to the view protocol. So meaning, run this code, see what it returns and use that, some view.
// creating instances of structs, named parameters and parameter defaults.
// creating a struct: now how do we create a struct, like the image and text down below, are structs but behave like a view. You go ahead and put the name, open parenthesis, then the arguements you need to pass, then close the parenthesis. this creates an instance of a struct, for example the image and text lines of code are structs behaving as views.
// named parameters: or labeled parameters are the names you provide to the arguments when you initialize or call something. Kind of like the Image line of code below, you initlialized a struct that behaves like a view and the named parameter you passed in was 'systemName'. The 'globe' is the VALUE provided for the parameter 'systemName'
// default parameters: with default parameters with do, it will give you a default. The standard default. For example the padding() will be provided to the code and apply a standard amount of padding however, if you wanna customize it, you can pass an a specific value inside of the parentheses.


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Stanford!")
        }
        .padding()
    }
}




#Preview {
    ContentView()
}
