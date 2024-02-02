//
//  MemorizeModel.swift
//  MatchGamePractice
//
//  Created by Joseph Masson on 2/1/24.
//

import Foundation


struct MemorizeModel {
    private(set) var cards: [Card]
    
    init(pairsOfCards: Int, cardContent: (Int) -> String) {
        cards = []
        
        for index in 0..<pairsOfCards {
            let content = cardContent(index)
            
            cards.append(Card(id: "\(index)a", isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(id: "\(index)b", isFaceUp: false, isMatched: false, content: content))
            

        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func choose(_ card: Card) {
        //do something
        print("chose \(card)")
    }
    
    struct Card: Identifiable{
        let id: String
        var isFaceUp: Bool
        var isMatched: Bool
        let content: String //fruit
        
        
    }
}

