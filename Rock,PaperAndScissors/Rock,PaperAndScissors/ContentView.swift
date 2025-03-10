//
//  ContentView.swift
//  Rock,PaperAndScissors
//
//  Created by Aksh Garg on 10/03/25.
//

import SwiftUI

struct ContentView: View {
    
    let move = ["Rock", "Paper", "Scissors"]
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var noOfRounds = 0
    @State  private var gameOver = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
            VStack {
                Text("Brain Training: Rock, Paper and Scissors")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                
                
                
                Text("Your Score: \(score)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                    .padding()
                
                Text("App Chose:")
                    .font(.title)
                    .foregroundStyle(.white)
                Text(move[appMove])
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text(shouldWin ? "You must WIN" : "You must LOSE")
                    .font(.title)
                    .foregroundStyle(.white)
                
                VStack {
                    ForEach(0..<3) { index in
                        Button {
                            playMove(index)
                        } label: {
                            Text(move[index])
                                .font(.system(size: 50))
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .padding()
                        }
                    }
                }
            }
            .alert("Game Over", isPresented: $gameOver) {
                Button("Restart", action: resetGame)
            } message: {
                Text("Your final score is \(score)")
            }
        }
    }
    
    func playMove(_ playerMove: Int) {
        let winningMoves = [1, 2, 0]
        
        let didWin = (playerMove == winningMoves[appMove])
        
        if shouldWin == didWin {
            score += 1
        } else {
            score -= 1
        }
        
        noOfRounds = 0
        if noOfRounds == 10 {
            gameOver = true
        } else {
            nextRound()
        }
    }
    
    func nextRound() {
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
 
    func resetGame() {
        score = 0
        noOfRounds = 0
        nextRound()
    }
    
}

#Preview {
    ContentView()
}
