//
//  ContentView.swift
//  War Card Game
//
//  Created by Aksh Garg on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
        
                Button{
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.title)
                            .padding(.bottom,10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.title)
                            .padding(.bottom,10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
            }
        }
    }
    
    func deal() {
        //Randomize playerCard
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        //Randomize cpuCard
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        //Update the Score
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if
            cpuCardValue > playerCardValue {
                cpuScore += 1
        }
    }
}
#Preview {
    ContentView()
}
