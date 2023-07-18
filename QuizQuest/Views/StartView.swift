//
//  ContentView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 17/7/23.
//

import SwiftUI

struct StartView: View {
    @State private var isShowingHowToPlayView: Bool = false
    
    var body: some View {
        VStack {
            Image("LaunchScreen")
                .resizable()
                .scaledToFit()
                .padding(.bottom, -100.0)

            Spacer()

            Button("New Game") {
                print("New Game")
            }.buttonStyle(QQPrimaryButtonStyle())

            Button("How to Play") {
                withAnimation {
                    self.isShowingHowToPlayView.toggle()
                }
            }.buttonStyle(QQSecondaryButtonStyle())

            Button("Special Thanks") {
                print("Special Thanks")
            }.buttonStyle(QQSecondaryButtonStyle())

            Spacer()
        }
        .padding()
        .sheet(isPresented: $isShowingHowToPlayView, content: {
            HowToPlayView(isShowingThisView: $isShowingHowToPlayView)
        })
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}