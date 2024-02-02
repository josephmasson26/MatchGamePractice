//
//  MemorizeViewModel.swift
//  MatchGamePractice
//
//  Created by Joseph Masson on 2/1/24.
//

import Foundation


class MemorizeViewModel: ObservableObject {
    @Published var model = MemorizeModel(pairsOfCards: 8, cardContent: { index in
        let fruits = ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓"]
        
        return fruits[index]
    })
    var cards: [MemorizeModel.Card] {
        model.cards
    }
    
    //Intents
    
    func choose(_ card: MemorizeModel.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
