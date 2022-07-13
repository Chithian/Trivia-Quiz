//
//  PrimaryButton.swift
//  Trivia Quiz
//
//  Created by Chithian on 10/7/22.
//

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var background: Color = Color("AccentColor")
    
    //Create Primary Button
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
