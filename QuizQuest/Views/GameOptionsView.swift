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
    
    private struct CategoryResponse: Codable {
        let trivia_categories: [Category]
    }

    private struct Category: Codable {
        let id: Int
        let name: String
    }
    
    @State private var categories: [Category] = []
    @State private var difficulties: [String] = ["Any Difficulty", "Easy", "Medium", "Hard"]
    @State private var answerTypes: [String] = ["Any Answer Type", "True or False", "Multiple Choice"]

    @State private var selectedCategoryID: Int = -1
    @State private var selectedDifficulty: String = "Any Difficulty"
    @State private var selectedAnswerType: String = "Any Answer Type"

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
                        .fontWeight(.bold)
                        .padding(.bottom, -20.0)) {
                        Picker(selection: $selectedCategoryID, label: Text("Category")) {
                            ForEach(categories, id: \.id) { category in
                                Text(category.name).tag(category.id)
                            }
                        }
                    }
                    .padding(.bottom, 20.0)
                    Section(header: Text("Difficulty")
                        .fontWeight(.bold)
                        .padding(.bottom, -20.0)) {
                            Picker(selection: $selectedDifficulty, label: Text("Difficulty")) {
                            ForEach(difficulties, id: \.self) { difficulty in
                                Text(difficulty).tag(difficulty)
                            }
                        }
                    }
                    .padding(.top, -10.0)
                    .padding(.bottom, 20.0)
                    Section(header: Text("AnswerType")
                        .fontWeight(.bold)
                        .padding(.bottom, -20.0)) {
                        Picker(selection: $selectedAnswerType, label: Text("AnswerType")) {
                            ForEach(answerTypes, id: \.self) { answerType in
                                Text(answerType).tag(answerType)
                            }
                        }
                    }
                    .padding(.top, -10.0)
                    .padding(.bottom, 20.0)
                    Section(header: Text("Number of Questions")
                        .fontWeight(.bold)
                        .padding(.bottom, 20.0)) {
                            Picker("Value", selection: $selectedIndex) {
                                ForEach(0..<values.count, id: \.self) { index in
                                    Text("\(values[index])")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(.top, -10.0)
                }
                .padding()
                
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
                GamePlayView(isShowingThisView: $isShowingGamePlayView, catAPI: mapCategory(categoryID: selectedCategoryID), diffAPI: mapDifficulty(difficulty: selectedDifficulty), ansTypeAPI: mapAnswerType(answerType: selectedAnswerType), ammountAPI: values[selectedIndex])
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
                allCategories.insert(Category(id: -1, name: "Any Category"), at: 0)
                
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
    
    func mapCategory(categoryID: Int) -> String {
        if categoryID == -1 {
            return ""
        }
        return String(categoryID)
    }
    
    func mapDifficulty(difficulty: String) -> String {
        let mapping: [String: String] = [
            "Any Difficulty": "",
            "Easy": "easy",
            "Medium": "medium",
            "Hard": "hard"]
        
        guard let mapped = mapping[difficulty] else {
            return ""
        }
        return mapped
    }
    
    func mapAnswerType(answerType: String) -> String {
        let mapping: [String: String] = [
            "Any Answer Type": "",
            "True or False": "boolean",
            "Multiple Choice": "multiple"]
        
        guard let mapped = mapping[answerType] else {
            return ""
        }
        return mapped
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionsView(isShowingThisView: .constant(true))
    }
}
