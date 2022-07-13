//
//  TriviaData.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import Foundation


struct TriviaData : Decodable {
    var results: [Result]
    
    struct Result : Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category : String
        var type : String
        var difficulty : String
        var question: String
        var correct_answer: String
        var incorrect_answers : [String]
        
        var answer: [Answer]{
            do {
                let correct = [Answer(text: try AttributedString(markdown: correct_answer), isCorrect: true)]
                let incorrects = try incorrect_answers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correct + incorrects
                
                return allAnswers.shuffled()
                
            } catch {
                print("Error formattedQuestion \(error)")
                return []
            }
        }
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            }catch {
                print("Erorr formattedQuest \(error)")
                return ""
            }
        }
        
    }
}
