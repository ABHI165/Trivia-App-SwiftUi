//
//  TriviaButton.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import SwiftUI

struct TriviaButton: View {
    
    let buttonText: String
    let background : Color
    var body: some View {
        
        Text(buttonText)
            .bold()
            .font(.title3)
            .fontWeight(.heavy)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(background)
            .cornerRadius(20)
        
       
    }
}

struct TriviaButton_Previews: PreviewProvider {
    static var previews: some View {
        TriviaButton(buttonText: "Let's Play", background: Color.black)
    }
}
