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
    
    var catAPI: String
    var difAPI: String
    var ansAPI: String
    var ammAPI: Int
    
    @State private var index = 0
    private let questions: [QQListQuestions] = []
    
    var body: some View {
        if isLoading {
            LoadingView()
                .onAppear {
                    fetchQuestions()
                }
        } else {
            NavigationView {
                VStack{
                    Text("Selected Category: \(catAPI)")
                    Text("Selected Difficulty: \(difAPI)")
                    Text("Selected Answer Type: \(ansAPI)")
                    Text("Selected Number of Questions: \(ammAPI)")
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
        GamePlayView(isShowingThisView: .constant(true), catAPI: "", difAPI: "", ansAPI: "", ammAPI: 0)
    }
}
