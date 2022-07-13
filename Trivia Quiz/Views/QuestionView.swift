//
//  QuestionVIew.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        VStack(spacing : 40){
            HStack {
                Text("Trivia Quiz")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color.orange)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: triviaManager.progress)
            
            
            
            VStack(alignment: .leading, spacing: 20) {
                Text("\(triviaManager.question)")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(Color.gray)
                
                ForEach(triviaManager.answerChoise, id: \.id) {
                    answer in AnswerRow(answer:  answer)
                        .environmentObject(triviaManager)
                }
//                AnswerRow(answer: Answer(text: "Flase", isCorrect: true))
//                AnswerRow(answer: Answer(text: "True", isCorrect: false))
                
                
                
            }
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color.orange : Color(hue: 1.0, saturation: 0.0, brightness: 0.4, opacity: 0.4))
                
            }
                .disabled(!triviaManager.answerSelected)
            
            
            
//            Banner(unitID: "ca-app-pub-1981542238186326/3464707259").frame(maxWidth: 320 , maxHeight: 100)
            
            Banner(unitID: "ca-app-pub-3940256099942544/2934735716").frame(maxWidth: 320 , maxHeight: 100)
            
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
       
    }
}

struct QuestionVIew_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
