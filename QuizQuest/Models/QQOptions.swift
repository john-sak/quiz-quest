//
//  QQOptions.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct CategoryResponse: Codable {
    let triviaCategories: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
}

struct DifficultyResponse: Codable {
    let difficulties: [String]
}

struct AnswerTypeResponse: Codable {
    let answerTypes: [String]
}
