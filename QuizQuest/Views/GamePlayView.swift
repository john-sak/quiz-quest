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
    
    @State private var score = 0
    @State private var userAnswer = ""
    
    var body: some View {
        if isLoading {
            LoadingView()
                .onAppear {
                    fetchQuestions()
                }
        } else {
            NavigationView {
                VStack{
                    ProgressView(value: Double(index + 1), total: Double(questions.count))
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding(.top, 50.0)
                        .padding(.horizontal, 50.0)

                    Spacer()
                    
                    Text(questions[index].question)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()
                    
                    VStack {
                        if questions[index].type == "boolean" {
                            Button("True") {
                                nextQuestion(answer: "True")
                            }
                            .buttonStyle(QQPrimaryButtonStyle())
                            
                            Button("False") {
                                nextQuestion(answer: "False")
                            }
                            .buttonStyle(QQPrimaryButtonStyle())
                        } else {
                            let allAnswers = questions[index].incorrect_answers + [questions[index].correct_answer]
                            
                            ForEach(allAnswers.shuffled(), id: \.self) {answer in
                                Button(answer) {
                                    nextQuestion(answer: answer)
                                }
                                .buttonStyle(QQPrimaryButtonStyle())
                            }
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Button("Exit") {
                        withAnimation {
                            isShowingThisView.toggle()
//                            TODO
//                            NavigationLink to StartPage
                        }
                    }
                    .buttonStyle(QQSecondaryButtonStyle())
                    .padding(.bottom, 30.0)
                }
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
    
    func nextQuestion(answer: String) {
        if answer == questions[index].correct_answer {
            score += 1
        }

        guard index < questions.count - 1 else {
//           TODO
//           NavigationLink to ScoreView
            return
        }
        
        index += 1
    }
}

struct GamePlay_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(isShowingThisView: .constant(true), catAPI: "", diffAPI: "", ansTypeAPI: "", ammountAPI: 0)
    }
}
