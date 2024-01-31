//
//  ContentView.swift
//  MatchGamePractice
//
//  Created by Joseph Masson on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var fruits : [String] = ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓"]
    @State var color: Color = .green
    
    var body: some View {
        CardView(content: "abcd", color: color)
        CardView(content: "content", color: color)
        
        ColorPicker(selection: $color, label: {})

    }
    
}

struct CardView: View {
    var content: String
    var color: Color
    
    @State var isFaceUp: Bool = true

    
    var body: some View {
    
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth: 5.0).foregroundColor(color)
            Text(content).font(.largeTitle)
            RoundedRectangle(cornerRadius: 25.0).foregroundColor(color).opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
    
}

#Preview {
    ContentView()
}
