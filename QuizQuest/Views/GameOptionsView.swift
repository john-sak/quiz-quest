//
//  NewGameView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct GameOptionsView: View {
    @Binding var isShowingThisView: Bool
    
    @State private var isLoading: Bool = true

    @State private var categories: [Category] = []
    @State private var difficulties: [String] = []
    @State private var answerTypes: [String] = []

    @State private var selectedCategory: String = ""
    @State private var selectedDifficulty: String = ""
    @State private var selectedAnswerType: String = ""

    @State private var selectedIndex: Int = 0
    private let values = Array(stride(from: 10, through: 30, by: 5))
    
    var body: some View {
        if isLoading {
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
                                    ForEach(0..<values.count, id: \.self) { index in
                                        Text("\(values[index])")
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                            .padding(.horizontal, 70.0)

                    }
                    
                    Spacer()
                    
                    HStack{
                        Button("Cancel") {
                            withAnimation {
                                isShowingThisView.toggle()
                            }
                        }
                        .buttonStyle(QQSecondaryButtonStyle())
                        .padding(.trailing, -50.0)
                        
                        Button("Start Game") {
                            withAnimation {
//                                isShowingNewGameOptionsView.toggle()
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
        isLoading.toggle()
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
