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
                .padding(.top, -50.0)
            Text("Welcome to QuizQuest!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
            Button() {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label: {
                Text("New Game")
                    .fontWeight(.black)
            }
            .buttonStyle(.borderedProminent)
            .accentColor(Color("AccentColor"))
            .controlSize(.large)
            .padding()
            Button() {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label: {
                Text("How to Play")
                    .fontWeight(.bold)
            }
            .buttonStyle(.bordered)
            .accentColor(Color("AccentColor"))
            .controlSize(.large)
            .padding()
            Button() {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label: {
                Text("Speacial Thanks")
            }
            .buttonStyle(.bordered)
            .accentColor(Color("AccentColor"))
            .controlSize(.large)
            .padding()
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
