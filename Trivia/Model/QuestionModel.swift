//
//  QuestionModel.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import Foundation

struct QuestionModel: Decodable {
    let results: [Results]?
}

struct Results: Decodable {
    let category: String?
    let type: String?
    let difficulty: String?
    let question: String?
    let correct_answer: String?
    let incorrect_answers: [String]?

    var formattedQuestion: AttributedString {
        do {
            return try AttributedString(markdown: question!)
        } catch {
            print("Error setting formattedQuestion: \(error)")
            return ""
        }
    }

    var answers: [AnswerModel] {
        do {
            let correctAnswer = [AnswerModel(answer: try AttributedString(markdown: correct_answer!), isCorrect: true)]
            let incorrectAnswer = try incorrect_answers?.map { answer in
                AnswerModel(answer: try AttributedString(markdown: answer), isCorrect: false)
            } ?? []
            return (correctAnswer + incorrectAnswer).shuffled()
        } catch {
            print("Something Went Worng")
            return []
        }
    }
}
