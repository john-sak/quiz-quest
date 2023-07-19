//
//  ContentView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 17/7/23.
//

import SwiftUI

struct StartView: View {
    @State private var isShowingNewGameView: Bool = false
    @State private var isShowingHowToPlayView: Bool = false
    @State private var isShowingSpecialThanksView: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .padding(30.0)

            Spacer()
            
            VStack{
                Button("New Game") {
                    withAnimation {
                        self.isShowingNewGameView.toggle()
                    }
                }
                .buttonStyle(QQPrimaryButtonStyle())
                .padding(.bottom, 5.0)

                Button("How to Play") {
                    withAnimation {
                        self.isShowingHowToPlayView.toggle()
                    }
                }
                .buttonStyle(QQSecondaryButtonStyle())

                Button("Special Thanks") {
                    withAnimation {
                        self.isShowingSpecialThanksView.toggle()
                    }
                }
                .buttonStyle(QQSecondaryButtonStyle())
            }

            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $isShowingNewGameView, content: {
            NewGameView(isShowingThisView: $isShowingNewGameView)
        })
        .sheet(isPresented: $isShowingHowToPlayView, content: {
            HowToPlayView(isShowingThisView: $isShowingHowToPlayView)
        })
        .sheet(isPresented: $isShowingSpecialThanksView, content: {
            SpecialThanksView(isShowingThisView: $isShowingSpecialThanksView)
        })
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
