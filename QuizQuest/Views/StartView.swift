//
//  ContentView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 17/7/23.
//

import SwiftUI

struct StartView: View {
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
                print("How to Play")
            }.buttonStyle(QQSecondaryButtonStyle())

            Button("Special Thanks") {
                print("Special Thanks")
            }.buttonStyle(QQSecondaryButtonStyle())

            Spacer()
        }
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
