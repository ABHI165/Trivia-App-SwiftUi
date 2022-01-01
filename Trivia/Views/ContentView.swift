//
//  ContentView.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var triviaManager: TriviaRepo

    var body: some View {
        if triviaManager.reachedEnd {
            ScoreView()
                .environmentObject(triviaManager)
        } else {
            QuestionVIew()
                .environmentObject(triviaManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
