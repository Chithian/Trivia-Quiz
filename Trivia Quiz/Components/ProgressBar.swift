//
//  ProgressBar.swift
//  Trivia Quiz
//
//  Created by Chithian on 11/7/22.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 400, maxHeight: 4)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.5, opacity: 0.4))
                .cornerRadius(10)
            Rectangle()
                .frame(maxWidth:progress , maxHeight: 4)
                .foregroundColor(Color.orange)
                .cornerRadius(10)
            
        }
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
            
    }
}
