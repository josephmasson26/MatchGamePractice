//
//  ContentView.swift
//  MatchGamePractice
//
//  Created by Joseph Masson on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel = MemorizeViewModel()
    
    @State var color: Color = .red
    
    
    var body: some View {
        VStack{
            //CardView(content: "abcd", color: color)
            //CardView(content: "content", color: color)
            ScrollView(.vertical) {
                cards
            }.scrollIndicators(.hidden)
            
            HStack{
                Button(action: {viewModel.shuffle()}, label:{
                    Image(systemName: "shuffle")
                })
                ColorPicker(selection: $color, label: {})
            }
        }
        .animation(.spring(), value: viewModel.cards)
        .padding(16.0)
        .environmentObject(viewModel)
    }
    var cards:some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(viewModel.cards) {
                card in 
                if !card.isMatched {
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                } else {
                    Rectangle()
                        .fill(.background)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
    
}

struct CardView: View {
    
    @EnvironmentObject var viewModel: MemorizeViewModel
    
    var card:

    
    

    
    var body: some View {
    
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Text(card.content).font(.largeTitle)
            RoundedRectangle(cornerRadius: 25.0).fill()
        }.onTapGesture {
            viewModel.choose(card)
        }
    }
    
}

#Preview {
    ContentView()
}
