//
//  NewGameView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct GameOptionsView: View {
    @Binding var isShowingThisView: Bool
    
    @State private var isShowingGamePlayView: Bool = false
    
    @State private var isLoading: Bool = true

    @State private var categories: [Category] = []
    @State private var difficulties: [String] = ["Any Difficulty", "Easy", "Medium", "Hard"]
    @State private var answerTypes: [String] = ["Any Answer Type", "True or False", "Multiple Choice"]

    @State private var selectedCategoryID: String = ""
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
            VStack {
                Spacer()
                
                Text("Choose any options below and customize them. 🥳")
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Section(header: Text("Category")
                        .fontWeight(.bold)) {
                        Picker(selection: $selectedCategoryID, label: Text("Category")) {
                            ForEach(categories, id: \.id) { category in
                                Text(category.name).tag(String(category.id))
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
                Spacer()
                
                HStack{
                    Button("Exit") {
                        withAnimation {
                            isShowingThisView.toggle()
                        }
                    }
                    .buttonStyle(QQSecondaryButtonStyle())
                    .padding(.trailing, -50.0)
                    
                    Button("Start Game") {
                        withAnimation {
                            isShowingGamePlayView.toggle()
                        }
                    }
                    .buttonStyle(QQPrimaryButtonStyle())
                    .padding(.leading, -50.0)
                }
                .padding(.bottom, 50.0)
            }
            .navigationTitle("Customize Game")
            .fullScreenCover(isPresented: $isShowingGamePlayView, content: {
                GamePlayView(isShowingThisView: $isShowingGamePlayView, selectedCategoryID: selectedCategoryID, selectedDifficulty: selectedDifficulty, selectedAnswerType: selectedAnswerType, selectedNumberOfQuestions: values[selectedIndex])
            })
        }
    }
    
    func fetchOptions() {
        fetchCategories()
        isLoading.toggle()
    }
    
    func fetchCategories() {
        guard let apiURL = URL(string: "https://opentdb.com/api_category.php") else {
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
                let decodedResponse = try JSONDecoder().decode(CategoryResponse.self, from: jsonData)
                
                var allCategories = decodedResponse.trivia_categories
                let anyCategory = Category(id: -1, name: "Any Category")
                allCategories.insert(anyCategory, at: 0)
                
                let updatedResponse = CategoryResponse(trivia_categories: allCategories)
                DispatchQueue.main.async {
                    self.categories = updatedResponse.trivia_categories
                }
            } catch {
                print("Error decoding JSON file: \(error)")
            }
        }
        
        task.resume()
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionsView(isShowingThisView: .constant(true))
    }
}
