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
                    Spacer()
                    
//                    TODO
//                    present questions
                    Text(questions[index].question)
                    
                    HStack {
                        Button("Exit") {
                            withAnimation {
                                isShowingThisView.toggle()
                            }
                        }
                        .buttonStyle(QQSecondaryButtonStyle())
                        .padding(.trailing, -50.0)
                        
                        if index < questions.count - 1 {
                            Button("Next") {
                                index += 1
                            }
                            .buttonStyle(QQPrimaryButtonStyle())
                            .padding(.leading, -50.0)
                        } else {
//                            Button("Finish") {
//                                withAnimation {
//                                    isShowingThisView.toggle()
//                                }
//                            }
//                            .buttonStyle(QQPrimaryButtonStyle())
//                            .padding(.leading, -50.0)
//
//                            TODO
//                            NavigationLink to ScoreView
                        }
                    }
                    .padding(.bottom, 30.0)
                }
                .navigationTitle("Game Playing")
            }
        }
    }
    
    func fetchQuestions() {
        let options: String = "?amount=" + String(ammountAPI) + (catAPI.isEmpty ? "" : "&category=" + catAPI) + (diffAPI.isEmpty ? "" : "&difficulty=" + diffAPI) + (ansTypeAPI.isEmpty ? "" : "&type=" + ansTypeAPI)

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
                    self.isLoading.toggle()
                }
            } catch {
                print("Error decoding JSON file: \(error)")
            }
        }
        
        task.resume()
    }
}

struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(isShowingThisView: .constant(true), catAPI: "", diffAPI: "", ansTypeAPI: "", ammountAPI: 0)
    }
}
