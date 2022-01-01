//
//  TriviaRepo.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import Foundation
import SwiftUI

class TriviaRepo: ObservableObject {
    private(set) var trivia: [Results] = []
    @Published private(set) var length = 0

    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [AnswerModel] = []

    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00

    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false

    init() {
        Task.init {
            await getQuestion()
        }
    }

    func getQuestion() async {
        do {
            let url = URL(string: "https://opentdb.com/api.php?amount=10")!

            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))

            guard (response as! HTTPURLResponse).statusCode == 200 else { return }

            let decodder = JSONDecoder()
            // decodder.keyDecodingStrategy = .convertFromSnakeCase
            let question = try decodder.decode(QuestionModel.self, from: data)

            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false

                // Set new values for all variables
                self.trivia = question.results ?? []
                self.length = self.trivia.count
                self.setQuestion()
            }

        } catch {
            //  fatalError("Something Went Wrong")
        }
    }

    func goToNextQuestion() {
        // If didn't reach end of array, increment index and set next question
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            // If reached end of array, set reachedEnd to true
            reachedEnd = true
        }
    }

    // Function to set a new question and answer choices, and update the progress
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 360)

        // Only setting next question if index is smaller than the trivia's length
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }

    // Function to know that user selected an answer, and update the score
    func selectAnswer(answer: AnswerModel) {
        answerSelected = true

        // If answer is correct, increment score
        if answer.isCorrect {
            score += 1
        }
    }
}
