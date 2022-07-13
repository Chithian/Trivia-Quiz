//
//  TopicView.swift
//  Trivia Quiz
//
//  Created by Chithian on 13/7/22.
//

import SwiftUI

struct TopicView: View {
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink("Car", destination: QuestionView())
                NavigationLink("Animal", destination: QuestionView())
                NavigationLink("Computer", destination: QuestionView())
                NavigationLink("Human", destination: QuestionView())
                NavigationLink("Phone", destination: QuestionView())
                NavigationLink("Book", destination: QuestionView())
                    
        
                }
            .navigationTitle("Topic Trivia")
            .listStyle(.insetGrouped)

                Text("Select a Color") // A placeholder to show before selection.
        }
       
       
        
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView()
    }
}
