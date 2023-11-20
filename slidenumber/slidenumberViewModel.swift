//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by KnoWhere on 31/10/23.
//

import SwiftUI

class slidenumberViewModel: ObservableObject {
    static let numbers = Array(1...16).map { "\($0)" }
    
    @Published private var model: slidenumberGameModel<String> = createModel()
    
    static func createModel() -> slidenumberGameModel<String> {
//        let useNumbers = numbers.shuffled()
        let useNumbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "16", "13", "14", "15", "12"]
        var model = slidenumberGameModel<String>(length: numbers.count, contentFactory: {(index) in useNumbers[index]})
//        model.shuffle()        
        
        return model
    }
    
    var cards: [slidenumberGameModel<String>.Card] { model.cards }
    
    func choose(_ card: slidenumberGameModel<String>.Card) {
        model.choose(card)
    }
    
    var moves: Int { model.moves }
    var isWin: Bool { model.check() }
        
    func restart() {
        model = slidenumberViewModel.createModel()
    }
}
