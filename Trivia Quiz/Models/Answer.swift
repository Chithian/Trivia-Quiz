//
//  Answer.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import Foundation


struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}


