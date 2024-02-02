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
        shuffle()
    }
    
    var indexOfFaceUpCard : Int?
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index] == card {
                return index
            }
        }
        
        return nil
    }
    
    mutating func choose(_ card: Card) {
        print("chose \(card)")
        
        if let indexOfCard = index(of: card) {
            if !cards[indexOfCard].isFaceUp && !cards[indexOfCard].isMatched {
                if let otherCardIndex = indexOfFaceUpCard {
                    if cards[indexOfCard].content == cards[otherCardIndex].content {
                        cards[indexOfCard].isMatched = true
                        cards[otherCardIndex].isMatched = true
                    }
                    indexOfFaceUpCard = nil
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfFaceUpCard = indexOfCard
                }
                cards[indexOfCard].isFaceUp = true
            }
        }
    }
    
    struct Card: Identifiable, Equatable{
        let id: String
        var isFaceUp: Bool
        var isMatched: Bool
        let content: String //fruit        
        
    }
}

