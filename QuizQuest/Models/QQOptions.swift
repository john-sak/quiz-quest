//
//  QQOptions.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct CategoryResponse: Codable {
    let trivia_categories: [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
}
//
//struct DifficultyResponse: Codable {
//    let difficulties: [String]
//}
//
//struct AnswerTypeResponse: Codable {
//    let answerTypes: [String]
//}
