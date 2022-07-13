//
//  AnswerRow.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import SwiftUI

struct AnswerRow: View {
    
    var answer: Answer
    @State private var isSelected = false
    @EnvironmentObject var triviaManager: TriviaManager
    
    var red = Color.red
    var green = Color.green
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ?
                    "checkmark.circle" :
                    "x.circle")
                .foregroundColor(answer.isCorrect ? green : red)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color.orange : .gray) : Color.orange)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green :  red): .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectedAnswer(answer: answer)
            }
            
        }
        
    }
    
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
