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
        VStack{
            //CardView(content: "abcd", color: color)
            //CardView(content: "content", color: color)
            ScrollView(.vertical) {
                cards
            }.scrollIndicators(.hidden)
            
            HStack{
                Button(action: {fruits.shuffle()}, label:{
                    Image(systemName: "shuffle")
                    })
                ColorPicker(selection: $color, label: {})
            }
        }
        .animation(.spring(), value: fruits)
        .padding(16.0)
        
        
    }
    var cards:some View {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(fruits, id: \.self) {
                fruit in CardView(content: fruit, color: color).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
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
