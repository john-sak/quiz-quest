//
//  NewGameView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct NewGameView: View {
    @Binding var isShowingThisView: Bool
    
    @State private var isShowingGamePlayView: Bool = false

    @State private var isLoading: Bool  = false

    @State private var categories: [Category] = []
    @State private var difficulties: [String] = []
    @State private var answerTypes: [String] = []

    @State private var selectedCategory: String = ""
    @State private var selectedDifficulty: String = ""
    @State private var selectedAnswerType: String = ""
    @State private var selectedNumberOfQuestions: Int = 5
    
    var body: some View {
        if self.isLoading {
            LoadingView()
                .onAppear {
                    fetchOptions()
                }
        } else {
            NavigationView {
                VStack {
                    Spacer()
                    
                    VStack{
                        Text("Below are all available Categories, Difficulties and Answer Types in the OpenTrivia Database.")
                            .padding(.bottom, 10.0)
                        Text("You can choose a specifc value for any of these options, and/or leave any of these blank. In this case, questions of all values for this option will be returned.")
                            .padding(.bottom, 10.0)
                        Text("Finally, you need to choose how many questions you want to answer!")
                    }
                    .padding(.horizontal, 30.0)
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Section(header: Text("Category")
                        .fontWeight(.bold)) {
                        Picker(selection: $selectedCategory, label: Text("Category")) {
                            ForEach(categories, id: \.id) { category in
                                Text(category.name).tag(category.id)
                            }
                        }
                    }
                    Section(header: Text("Difficulty")
                        .fontWeight(.bold)) {
                        Picker(selection: $selectedDifficulty, label: Text("Difficulty")) {
                            ForEach(difficulties, id: \.self) { difficulty in
                                Text(difficulty).tag(difficulty)
                            }
                        }
                    }
                    Section(header: Text("AnswerType")
                        .fontWeight(.bold)) {
                        Picker(selection: $selectedAnswerType, label: Text("AnswerType")) {
                            ForEach(answerTypes, id: \.self) { answerType in
                                Text(answerType).tag(answerType)
                            }
                        }
                    }
                    Section(header: Text("Number of Questions")
                        .fontWeight(.bold)) {
                            Slider(value: Binding<Double>(
                                get: { Double(selectedNumberOfQuestions) },
                                set: { selectedNumberOfQuestions = Int($0) }
                            ), in: 5...50, step: 5) {
                                Text("\(selectedNumberOfQuestions)")
                            }
                        }
                        .padding(.horizontal, 50.0)
                    
                    Spacer()
                    
                    HStack{
                        Button("Exit") {
                            withAnimation {
                                self.isShowingThisView.toggle()
                            }
                        }
                        .buttonStyle(QQSecondaryButtonStyle())
                        .padding(.trailing, -50.0)
                        
                        Button("Start Game") {
                            withAnimation {
                                self.isShowingGamePlayView.toggle()
                            }
                        }
                        .buttonStyle(QQPrimaryButtonStyle())
                        .padding(.leading, -50.0)
                    }
                    .padding(.bottom, 50.0)
                }
                .navigationTitle("New Game")
                .fullScreenCover(isPresented: $isShowingGamePlayView, content: {
                    GamePlayView(isShowingThisView: $isShowingGamePlayView)
                })
            }
        }
    }
    
    func fetchOptions() {
        fetchCategories()
        fetchDifficulties()
        fetchAnswerTypes()
        self.isLoading.toggle()
    }
    
    func fetchCategories() {
//        TODO
    }
    
    func fetchDifficulties() {
//        TODO
    }
    
    func fetchAnswerTypes() {
//        TODO
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView(isShowingThisView: .constant(true))
    }
}
