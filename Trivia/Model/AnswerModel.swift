//
//  AnswerModel.swift
//  Trivia
//
//  Created by Abhishek Agarwal on 25/12/21.
//

import Foundation

struct AnswerModel: Identifiable {
    let id = UUID()
    let answer: AttributedString
    let isCorrect: Bool
}
