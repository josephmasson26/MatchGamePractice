//
//  ContentView.swift
//  MatchGamePractice
//
//  Created by Joseph Masson on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MemorizeViewModel()
    
    @State var cardColor: Color = .red
    
    
    var body: some View {
        VStack{
            ScrollView(.vertical) {
                cards
            }
            Spacer()
            cardShuffler
            }
        .padding()
        }
 
    var cards:some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) {
                index in
                CardView(card: viewModel.cards[index]).aspectRatio(2/3, contentMode: .fit).padding(.vertical)
                    .onTapGesture {
                        viewModel.choose(viewModel.cards[index])
                    }
                
            }
        }.foregroundColor(cardColor)
    }
    
    var cardShuffler : some View {
            HStack {
                Button(action: {
                    viewModel.shuffle()
                }, label: {
                    Image(systemName: "shuffle")
                })
                Spacer()
                ColorPicker(selection: $cardColor, label: {

                })
                

            }
            .font(.title)
        }
    
}

struct CardView: View {
    
    
    
    var card: MemorizeModel.Card
    
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth: 5)
            Text(card.content).font(.largeTitle)
            RoundedRectangle(cornerRadius: 25.0).fill().opacity(card.isFaceUp ? 1 : 0)
        }
        
    }
    
    
}

#Preview {
    ContentView(viewModel: MemorizeViewModel())
}
