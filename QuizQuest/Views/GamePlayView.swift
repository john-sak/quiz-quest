//
//  GamePlay.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 20/7/23.
//

import SwiftUI

struct GamePlayView: View {
    @Binding var isShowingThisView: Bool
    
    @State private var isLoading: Bool = true
    
    var selectedCategoryID: String
    var selectedDifficulty: String
    var selectedAnswerType: String
    var selectedNumberOfQuestions: Int
    
    var body: some View {
        if isLoading {
            LoadingView()
                .onAppear {
                    fetchQuestions()
                }
        } else {
            NavigationView {
                VStack{
                    Text("Selected Category: \(selectedCategoryID)")
                    Text("Selected Difficulty: \(selectedDifficulty)")
                    Text("Selected Answer Type: \(selectedAnswerType)")
                    Text("Selected Number of Questions: \(selectedNumberOfQuestions)")
                }
                .navigationTitle("Game Playing")
            }
        }
    }
    
    func fetchQuestions() {
//        TODO
        isLoading.toggle()
    }
}

struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(isShowingThisView: .constant(true), selectedCategoryID: "", selectedDifficulty: "", selectedAnswerType: "", selectedNumberOfQuestions: 0)
    }
}
