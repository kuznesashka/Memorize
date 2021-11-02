//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandra Kuznetsova on 25.10.2021.
//

import SwiftUI

struct ContentView: View {
    var emojisVehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒",
        "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🚡"]
    
    var emojisFood = ["🍏", "🥭", "🍑", "🥨", "🍔", "🥓", "🍞", "🌮", "🍟", "🍕", "🧆", "🫕", "🌭", "🍗", "🍤", "🥖"]
    
    var emojisFun = ["🏀", "🏸", "🛼", "🏄‍♀️", "🥊", "🪂", "🛹", "🎱", "🥌", "🤿", "🏊‍♀️", "🪃", "🏉", "🥎", "🥋", "🏐"]
    
    @State var cardCount = 16
    @State var themeIndicator = "vehicles"
    
    func estimateMinimumCardSize(cardCount: Int) -> CGFloat {
        if cardCount <= 4 {
            return 100
        }
        else if cardCount <= 9 {
            return 80
        }
        else {return 60}
    }
    
    var minimumCardSize: CGFloat {
        return estimateMinimumCardSize(cardCount: cardCount)
    }
    
    func switchTheme(themeIndicator: String) -> [String] {
        if themeIndicator == "vehicles" {
            return emojisVehicles.shuffled()
        }
        else if themeIndicator == "food" {
            return emojisFood.shuffled()
        }
        else {
            return emojisFun.shuffled()
        }
    }
    
    var emojis: [String] {
        return switchTheme(themeIndicator: themeIndicator)
    }
    
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumCardSize))]) {
                    ForEach(emojis[0..<cardCount], id: \.self){
                        emoji in CardView(content: emoji)
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(.green)
            .padding(.horizontal)
            .font(.largeTitle)
            HStack{
                Button(action: {
                    themeIndicator = "vehicles"
                    cardCount = Int.random(in: 4...16)
                }) {
                    VStack {
                        Image(systemName: "car").font(.largeTitle)
                        Text("Vehicles")
                    }
                }
                Spacer()
                Button(action: {
                    themeIndicator = "food"
                    cardCount = Int.random(in: 4...16)
                }) {
                    VStack {
                        Image(systemName: "mouth").font(.largeTitle)
                        Text("Food")
                    }
                }
                Spacer()
                Button(action: {
                    themeIndicator = "fun"
                    cardCount = Int.random(in: 4...16)
                }) {
                    VStack {
                        Image(systemName: "gamecontroller").font(.largeTitle)
                        Text("Fun")
                    }
                }
            }
        }
        .padding()
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
