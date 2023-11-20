//
//  ContentView.swift
//  slidenumber
//
//  Created by KnoWhere on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: slidenumberViewModel
    
    var body: some View {
        VStack {
            Text("New Game")
                .foregroundStyle(.green)
                .bold()
                .font(.largeTitle)
            cards
                .animation(.default, value: viewModel.cards)
            Spacer()
            if viewModel.isWin {
                Text("You Won!!!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.red)
            }
            Text("Moves: \(viewModel.moves)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.blue)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
            ForEach(viewModel.cards) {
                card in CardView(card: card)
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
}


struct CardView: View {
    let card: slidenumberGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if card.content != "16" {
                Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(.orange, lineWidth: 2)
                    Text(card.content)
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                }
            }
        }
        
    }
}

#Preview {
    ContentView(viewModel: slidenumberViewModel())
}
