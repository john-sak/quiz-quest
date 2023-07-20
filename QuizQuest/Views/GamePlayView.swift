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
    var diffAPI: String
    var ansTypeAPI: String
    var ammountAPI: Int
    
    private struct QuestionResponse: Codable {
        let response_code: Int
        let results: [QQQuestion]
    }
    
    private struct QQQuestion: Codable {
        let category: String
        let type: String
        let difficulty: String
        let question: String
        let correct_answer: String
        let incorrect_answers: [String]
    }
    
    @State private var index = 0
    @State private var questions: [QQQuestion] = []
    
    var body: some View {
        if isLoading {
            LoadingView()
                .onAppear {
                    fetchQuestions()
                }
        } else {
            NavigationView {
                VStack{
                    Text("\(questions.count)")
                }
                .navigationTitle("Game Playing")
            }
        }
    }
    
    func fetchQuestions() {
        let options: String = "?amount=" + String(ammountAPI) + (catAPI.isEmpty ? "" : "&category=" + catAPI) + (diffAPI.isEmpty ? "" : "&difficulty=" + diffAPI) + (ansTypeAPI.isEmpty ? "" : "&type=" + ansTypeAPI)
        print(options)
        guard let apiURL = URL(string: "https://opentdb.com/api.php" + options) else {
            print("Error hitting API")
            return
        }
        let session = URLSession.shared
        
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            if let error = error {
                print("Error fetching categories: \(error)")
                return
            }
            
            guard let jsonData = data else {
                print("Error receiving data")
                return
            }
            
            do {
                let decodeQuestions = try JSONDecoder().decode(QuestionResponse.self, from: jsonData)

                DispatchQueue.main.async {
                    self.questions = decodeQuestions.results
                }
            } catch {
                print("Error decoding JSON file: \(error)")
            }
        }
        
        task.resume()
        isLoading.toggle()
    }
}

struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(isShowingThisView: .constant(true), catAPI: "", diffAPI: "", ansTypeAPI: "", ammountAPI: 0)
    }
}
