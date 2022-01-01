//
//  ScoreView.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 01/01/22.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var triviaManager: TriviaRepo
    var body: some View {
        NavigationView {
            Text("Your score is \(triviaManager.score)")
                .bold()
                .font(.title)
                .fontWeight(.heavy)
                .padding()

            NavigationLink {
                MainScreen()
            } label: {
                TriviaButton(buttonText: triviaManager.index + 1 == 10 ? "Submit" : "Next", background: triviaManager.answerSelected ? Color.black : Color.gray)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
