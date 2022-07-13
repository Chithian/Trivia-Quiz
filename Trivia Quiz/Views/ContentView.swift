//
//  ContentView.swift
//  Trivia Quiz
//
//  Created by Chithian on 10/7/22.
//

import SwiftUI
import GoogleMobileAds

struct ContentView: View {
    
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 40) {
                
                Image("logo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.all)
                    
                
                VStack(spacing: 20) {
                    Text("Trivia Quiz Challenge")
                        .lilacTitle()
                    Text("Are you ready to for Trivia Quiz Challenge ? ").foregroundColor(Color.orange)
                    
                }
                
                NavigationLink  {
                    CongratulationView()
                        .environmentObject(triviaManager)
                } label: {
                    //Button
                    PrimaryButton(text: "Let's Start")
                    
                }
                
            }
            .frame(maxWidth: .infinity ,maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
