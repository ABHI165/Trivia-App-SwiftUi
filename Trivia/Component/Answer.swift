//
//  Answer.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import SwiftUI

struct Answer: View {
    @EnvironmentObject var triviaManager: TriviaRepo
    @State private var isSelected = false

    var answer: AnswerModel

    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)

            Text(answer.answer)
                .bold()
                .foregroundColor(.black)

            if isSelected {
                Spacer()

                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? .black : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? answer.isCorrect ? green : red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct Answer_Previews: PreviewProvider {
    static var previews: some View {
        Answer(answer: AnswerModel(answer: "", isCorrect: true))
            .environmentObject(TriviaRepo())
    }
}
