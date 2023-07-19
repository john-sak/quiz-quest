//
//  AboutMeView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 19/7/23.
//

import SwiftUI

struct AboutMeView: View {
    @Binding var isShowingThisView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack {
                    Text("QuizQuest was developed in July 2023!")
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("I am a recent graduate in Computer Science with a strong passion for iOS development and this is my first-ever iOS project.")
                        .padding()
                    Text("If you enjoyed using the app and would like to connect or explore more of my work, you can visit my GitHub. Your feedback and suggestions are always welcome!")
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    Text("🌐 Link is down below ⬇️")
                        .fontWeight(.bold)
                        .padding()
                }
                .padding(.horizontal, 30.0)
                .padding(.vertical)
                .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Button("My GitHub") {
                        if let url = URL(string: "https://github.com/john-sak") {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                    .buttonStyle(QQSecondaryButtonStyle())
                    
                    Button("Home Screen") {
                        withAnimation {
                            self.isShowingThisView.toggle()
                        }
                    }
                    .buttonStyle(QQPrimaryButtonStyle())
                    .padding(.top, 5.0)
                    .padding(.bottom, 30.0)
                }
            }
            .navigationTitle("About Me")
        }
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView(isShowingThisView: .constant(true))
    }
}
