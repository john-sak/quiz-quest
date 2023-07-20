//
//  QQQuestion.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct QQListQuestions: Codable {
    let questions: [QQQuestion]
}

struct QQQuestion: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
