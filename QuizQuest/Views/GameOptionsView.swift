//
//  NewGameView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct GameOptionsView: View {
    @Binding var isShowingThisView: Bool
    
    @State private var isLoading: Bool = false

    @State private var categories: [Category] = []
    @State private var difficulties: [String] = []
    @State private var answerTypes: [String] = []

    @State private var selectedCategory: String = ""
    @State private var selectedDifficulty: String = ""
    @State private var selectedAnswerType: String = ""

    @State private var selectedIndex: Int = 0
    let values = Array(stride(from: 10, through: 30, by: 5))
    
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
                    
                    VStack {
                        Text("Customize your Game! 🥳")
                            .fontWeight(.bold)
                            .padding(.bottom)
                        Text("Choose any options below and customize them.")
                            .padding(.top)
                    }
                    .padding()
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    VStack {
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
                                Picker("Value", selection: $selectedIndex) {
                                    ForEach(0..<values.count) { index in
                                        Text("\(values[index])")
                                    }
                                }
                                .pickerStyle(.segmented)
                                
//                                Slider(value: Binding<Double>(
//                                    get: { Double(selectedNumberOfQuestions) },
//                                    set: { selectedNumberOfQuestions = Int($0) }
//                                ), in: 5...50, step: 5) {
//                                    Text("\(selectedNumberOfQuestions)")
//                                }
                            }
                            .padding(.horizontal, 70.0)

                    }
                    
                    Spacer()
                    
                    HStack{
                        Button("Cancel") {
                            withAnimation {
                                self.isShowingThisView.toggle()
                            }
                        }
                        .buttonStyle(QQSecondaryButtonStyle())
                        .padding(.trailing, -50.0)
                        
                        Button("Start Game") {
                            withAnimation {
//                                self.isShowingNewGameOptionsView.toggle()
                            }
                        }
                        .buttonStyle(QQPrimaryButtonStyle())
                        .padding(.leading, -50.0)
                    }
                    .padding(.bottom, 50.0)
                }
                .navigationTitle("Customize Game")
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
        GameOptionsView(isShowingThisView: .constant(true))
    }
}
