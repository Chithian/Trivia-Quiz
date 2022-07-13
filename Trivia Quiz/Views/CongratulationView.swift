//
//  TriviaView.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import SwiftUI

struct CongratulationView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        
        if triviaManager.reachEnd {
            //
            VStack(spacing: 20) {
                
                Text("Trivia Quiz")
                    .font(.largeTitle)
                    .lilacTitle()
                    
                Text("Congratulation, You completed the challenge")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.orange)
                Text("🎉🎊🥳")
                    .font(.largeTitle)
                
                Text("Your Trivia Quiz Score \(triviaManager.score) out of \(triviaManager.length) 🎖")
                    .foregroundColor(Color.orange)
                    .bold()
                    
                Button {
                    Task.init() {
                        await triviaManager.fectchTrivia()
                    }
                }label: {
                    PrimaryButton(text: "Play Again")
                }
              
                
                NavigationLink  {
                    ContentView()
                } label: {
                    //Button
                    PrimaryButton(text: "🏡")
                    
                }
            }
            
                .foregroundColor(Color.red)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }else {
            QuestionView()
                .environmentObject(triviaManager)
        }
        
       
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationView()
            .environmentObject(TriviaManager())
    }
}
