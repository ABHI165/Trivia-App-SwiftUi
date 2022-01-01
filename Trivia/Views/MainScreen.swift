//
//  MainScreen.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var triviaManager = TriviaRepo()
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome To Trivia!")
                    .bold()
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()

                NavigationLink {
                    ContentView()
                        .environmentObject(triviaManager)
                } label: {
                    TriviaButton(buttonText: "Let's Play", background: Color.black)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.yellow)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
