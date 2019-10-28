//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Ilenwabor on 26/10/2019.
//  Copyright © 2019 Davidemi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var moves = ["ROCK", "PAPER", "SCISSORS"]
    private var symbols = ["✊🏾", "✋🏾", "✌🏾"]
    @State private var appCurrentChoice : Int = Int.random(in: 0...2)
    @State private var shouldPlayerWin : Bool = Bool.random()
    @State private var currentScore : Int = 0
    @State private var isAlertShown : Bool = false
    @State private var currentDisplayedText = ""
    @State private var currentRound : Int = 1
    
    private var totalAttempts = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 70){
                    Text("ROUND \(currentRound) of 10").font(.largeTitle).foregroundColor(.yellow)
                    Text("Your Score : \(currentScore)").foregroundColor(.white)
                    Text("Make a Move on \(moves[appCurrentChoice])").foregroundColor(.white)
                    if shouldPlayerWin{
                        Text("TRY TO WIN").foregroundColor(.green).font(.headline)
                    } else{
                        Text("TRY TO LOSE").foregroundColor(.red).font(.system(size: 16, weight: .bold))
                    }
                    
                    HStack{
                        ForEach(0..<moves.count) { num in
                            Button(action: {
                                self.didPlayerWinOrLose(index: num)
                            }) {
                                Text(self.symbols[num]).font(.system(size: 100))
                            }
                        }
                    }
                    Spacer()
                }
            }
            
        }
        .alert(isPresented: $isAlertShown) {
            
            Alert(title: Text("Rock, Paper, Scissors"), message: Text(currentDisplayedText).foregroundColor(.yellow), dismissButton: .default(Text("Continue"), action: {
                self.restartGame()
            }))
        }
    }
    
    private func didPlayerWinOrLose(index : Int){
        if appCurrentChoice == index{
            if currentRound == 10{
                currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                isAlertShown = true
                return
            }
            currentDisplayedText = "Its a draw, try again,"
            isAlertShown = true
            return
        }
        if shouldPlayerWin{
            if index > appCurrentChoice && appCurrentChoice != 2{
                currentScore += 1
                if currentRound == 10{
                    currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                } else{
                    currentDisplayedText = "Correct choice, keep playing😃."
                }
                isAlertShown = true
            } else if appCurrentChoice == 2 && index == 0{
                currentScore += 1
                if currentRound == 10{
                    currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                } else{
                    currentDisplayedText = "Correct choice, keep playing😃."
                }
                isAlertShown = true
            } else{
                if currentRound == 10{
                    currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                } else{
                    currentDisplayedText = "Wrong choice😢"
                }
                
                isAlertShown = true
            }
        } else{
            if index < appCurrentChoice && appCurrentChoice != 0{
                currentScore += 1
                if currentRound == 10{
                    currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                } else{
                    currentDisplayedText = "Correct choice, keep playing😃."
                }
                isAlertShown = true
            } else if appCurrentChoice == 0 && index == 2{
                currentScore += 1
                if currentRound == 10{
                    currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                } else{
                    currentDisplayedText = "Correct choice, keep playing😃."
                }
                isAlertShown = true
            } else{
                if currentRound == 10{
                    currentDisplayedText = currentScore > 5 ? "Congratulations🎉, you made \(currentScore) choices correctly, tap continue to start a new game" : "Oops😢🥺, your score was below average, start a new game to become better."
                } else{
                    currentDisplayedText = "Wrong choice😢"
                }
                isAlertShown = true
            }
        }
    }
    
    private func restartGame(){
        print("current round here is \(currentRound)")
        currentRound += 1
        if currentRound > 10{
            currentRound = 1
            currentScore = 0
            shouldPlayerWin = Bool.random()
            appCurrentChoice = Int.random(in: 0...2)
        } else{
            shouldPlayerWin = Bool.random()
            appCurrentChoice = Int.random(in: 0...2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
