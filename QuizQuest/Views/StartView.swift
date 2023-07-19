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
    @State private var isShowingAcknowledgmentsView: Bool = false
    @State private var isShowingAboutMeView: Bool = false
    
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
                        isShowingNewGameView.toggle()
                    }
                }
                .buttonStyle(QQPrimaryButtonStyle())
                .padding(.bottom, 5.0)

                Button("How to Play") {
                    withAnimation {
                        isShowingHowToPlayView.toggle()
                    }
                }
                .buttonStyle(QQSecondaryButtonStyle())

                Button("Acknowledgments") {
                    withAnimation {
                        isShowingAcknowledgmentsView.toggle()
                    }
                }
                .buttonStyle(QQSecondaryButtonStyle())
                
                Button("About Me") {
                    withAnimation {
                        isShowingAboutMeView.toggle()
                    }
                }
                .buttonStyle(QQSecondaryButtonStyle())
            }

            Spacer()
        }
        .padding()
        .sheet(isPresented: $isShowingNewGameView, content: {
            GameRulesView(isShowingThisView: $isShowingNewGameView)
        })
        .sheet(isPresented: $isShowingHowToPlayView, content: {
            HowToPlayView(isShowingThisView: $isShowingHowToPlayView)
        })
        .sheet(isPresented: $isShowingAcknowledgmentsView, content: {
            AcknowledgmentsView(isShowingThisView: $isShowingAcknowledgmentsView)
        })
        .sheet(isPresented: $isShowingAboutMeView, content: {
            AboutMeView(isShowingThisView: $isShowingAboutMeView)
        })
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
