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
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // todo
                
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

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView(isShowingThisView: .constant(true))
    }
}
