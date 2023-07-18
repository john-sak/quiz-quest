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

                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center) {
                        Text("🛜")
                            .padding(.trailing)
                        Text("You need an Internet connection to play the game.")
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical)
                    
                    HStack(alignment: .center) {
                        Text("🕹️")
                            .padding(.trailing)
                        Text("Hit \"New Game\", choose the number of questions you want and try to answer as many as you can correctly.")
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical)
                    
                    HStack(alignment: .center) {
                        Text("💯")
                            .padding(.trailing)
                        Text("In the end you will be scored, so be careful!")
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal, 50.0)
                
                Spacer()
                
                Button("OK") {
                    withAnimation {
                        self.isShowingThisView.toggle()
                    }
                }
                .buttonStyle(QQPrimaryButtonStyle())
                
                Spacer()
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
