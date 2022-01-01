//
//  QuestionVIew.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import SwiftUI

struct QuestionVIew: View {
    @EnvironmentObject var triviaManager: TriviaRepo

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Trivia Game!")
                    .bold()
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding()

                Spacer()

                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .bold()
                    .font(.title3)
                    .fontWeight(.heavy)
                    .padding()
            }.padding(.top, 50)

            ProgressBar(progress: triviaManager.progress)
                .padding()
                .shadow(color: Color.black, radius: 20, x: 10, y: 10)

            Text(triviaManager.question)
                .bold()
                .font(.title3)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding()

            VStack(alignment: .leading, spacing: 20) {
                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                    Answer(answer: answer)
                }
                Button {
                    if !triviaManager.reachedEnd { triviaManager.goToNextQuestion() }
                    else {}

                } label: {
                    TriviaButton(buttonText: triviaManager.index + 1 == 10 ? "Submit" : "Next", background: triviaManager.answerSelected ? Color.black : Color.gray)
                }
                .disabled(!triviaManager.answerSelected)

                Spacer()
            }
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct QuestionVIew_Previews: PreviewProvider {
    static var previews: some View {
        QuestionVIew().environmentObject(TriviaRepo())
    }
}
