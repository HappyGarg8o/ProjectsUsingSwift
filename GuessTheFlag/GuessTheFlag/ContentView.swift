//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Aksh Garg on 06/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.heavy))
                    .padding()
                
                VStack(spacing: 30) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .font(.title.weight(.bold))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundStyle(.white)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.buttonBorder)
                                .shadow(radius: 10)
                        }
                    }
                }
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Conitnue", action: askQuestion)
                } message: {
                    Text("Your score is \(playerScore)")
                }
                Text("SCORE: \(playerScore)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.semibold))
                    .padding(.top, 15)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            playerScore += 1
        } else {
            scoreTitle = "Wrong"
            playerScore = 0
        }
        showingScore = true
    }
        
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
