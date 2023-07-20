//
//  GameRulesView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 19/7/23.
//

import SwiftUI

struct GameRulesView: View {
    @Binding var isShowingThisView: Bool
    
    @State private var isShowingGameOptionsView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack {
                    Text("In the next screen you can customize your new game! ✏️")
                        .fontWeight(.bold)
                        .padding(.vertical)
                    Text("When you hit \"Next\" below, all available customizations will be fetched and you will be able to select customize these options:")
                        .padding(.vertical)
                    HStack(alignment: .center) {
                        Text("Category")

                        Spacer()

                        Text("Difficulty")

                        Spacer()

                        Text("Answer Type")
                    }
                    .fontWeight(.bold)
                    .padding(.vertical)
                    Text("You can choose one value for each option, for as many options as you want!")
                        .padding(.vertical)
                    Text("Finally, you will need to select how many answers you want to answer.")
                        .padding(.bottom)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40.0)
                
                Spacer()
                Spacer()
                
                HStack {
                    Button("Cancel") {
                        withAnimation {
                            isShowingThisView.toggle()
                        }
                    }
                    .buttonStyle(QQSecondaryButtonStyle())
                    .padding(.trailing, -50.0)
                    
                    Button("Play") {
                        withAnimation {
                            isShowingGameOptionsView.toggle()
                        }
                    }
                    .buttonStyle(QQPrimaryButtonStyle())
                    .padding(.leading, -50.0)
                }
                .padding(.bottom, 30.0)
            }
            .navigationTitle("New Game")
            .fullScreenCover(isPresented: $isShowingGameOptionsView, content: {
                GameOptionsView(isShowingThisView: $isShowingGameOptionsView)
            })
        }
    }
}

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView(isShowingThisView: .constant(true))
    }
}
