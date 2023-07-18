//
//  HowToPlayView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct HowToPlayView: View {
    @Binding var isShowingThisView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack() {
                    VStack {
                        Text("🛜")
                            .padding(.bottom, 5.0)
                        Text("You need an Internet connection to play the game.")
                            .multilineTextAlignment(.center)
                    }
                    .padding()

                    VStack {
                        Text("🕹️")
                            .padding(.bottom, 5.0)
                        Text("Hit \"New Game\", choose the number of questions you want and try to answer as many as you can correctly.")
                            .multilineTextAlignment(.center)
                    }
                    .padding()

                    VStack {
                        Text("💯")
                            .padding(.bottom, 5.0)
                        Text("In the end you will be scored, so be careful!")
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .padding(.horizontal, 50.0)
                
                Spacer()
                
                Button("OK") {
                    withAnimation {
                        self.isShowingThisView.toggle()
                    }
                }
                .padding(.bottom, 50.0)
                .buttonStyle(QQPrimaryButtonStyle())
            }
            .navigationTitle("How to Play")
        }
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView(isShowingThisView: .constant(true))
    }
}
