//
//  TriviaManager.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [TriviaData.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoise: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init{
            await fectchTrivia()
        }
        
    }
    
    func fectchTrivia() async {
        var category = 1
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5&category=17&difficulty=easy") else { fatalError("Missing URL error")}
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fectch data ")}
            
            let decoder = JSONDecoder()
            
            let decoderData = try decoder.decode(TriviaData.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachEnd = false
                
                self.trivia = decoderData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
            
        } catch {
            print("Error Fectching Trivia Data\(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            //setting new question ...
            setQuestion()
        }else{
            reachEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoise = currentTriviaQuestion.answer
        }
    }
    func selectedAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
