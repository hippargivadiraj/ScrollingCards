//
//  ContentView.swift
//  ScrollingCards
//
//  Created by Vadiraj Hippargi on 10/17/23.
//

import SwiftUI

struct CardItem:Identifiable {
    let id:Int
var bgColor:Color
}

struct ContentView: View {
    
    let cards = [CardItem(id:0, bgColor: .blue),CardItem(id:1, bgColor: .yellow),CardItem(id:2, bgColor: .green),CardItem(id:3, bgColor: .purple) ]
    let cards2 = [CardItem(id:0, bgColor: .red),CardItem(id:1, bgColor: .mint),CardItem(id:2, bgColor: .orange),CardItem(id:3, bgColor: .indigo) ]
   
    enum cardSet: String, CaseIterable, Identifiable {
         case solidColors, gradientColors, patterns, images
         var id: Self { self }
     }
    @State private var selectedCardSet: cardSet = .solidColors
    
    var body: some View {
        List {
            Picker("Choose Card Background", selection: $selectedCardSet) {
                ForEach(cardSet.allCases) { cardbunch in
                    Text(cardbunch.rawValue.capitalized)
                    
                }
            }
            
            ScrollView(.horizontal){
                if selectedCardSet == .solidColors {
                LazyHStack {
                   
                        ForEach(cards) { card in
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(card.bgColor)
                                .containerRelativeFrame(.horizontal)
                                .frame(width: 350, height: 200, alignment: .center)
                            
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content.scaleEffect(x:phase.isIdentity ? 1: 0.8, y:phase.isIdentity ? 1: 0.8 )
                                }
                            
                            
                            
                            
                        }
                    }
                }else if selectedCardSet == .gradientColors{
                    LazyHStack {
                        ForEach(cards2) { card in
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(card.bgColor)
                                .containerRelativeFrame(.horizontal)
                                .frame(width: 350, height: 200, alignment: .center)
                            
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content.scaleEffect(x:phase.isIdentity ? 1: 0.8, y:phase.isIdentity ? 1: 0.8 )
                                }
                            
                            
                            
                            
                        }
                        
                    }
                }
            }.contentMargins(20)
                .scrollIndicators(.hidden)
            // .background(LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
}
