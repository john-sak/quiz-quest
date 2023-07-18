//
//  SpecialThanksView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct SpecialThanksView: View {
    @Binding var isShowingThisView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("QuizQuest was created in July 2023")
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    Text("This project marks my first iOS app, and I'm thrilled to share it with you.")
                        .padding(.vertical)
                    Text("A big shout out to OpenTriviaDB for providing the fantastic questions and answers that make this app engaging.")
                        .padding(.vertical)
                    Text("If you enjoyed using the app and would like to connect or explore more of my work, please visit my GitHub. Your feedback and suggestions are always welcome!")
                        .padding(.vertical)
                    
                    HStack {
                        Spacer()
                        
                        Text("My GitHub")
                            .foregroundColor(.blue)
                            .underline(true, color: .blue)
                            .onTapGesture {
                                if let url = URL(string: "https://github.com/john-sak") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        
                        Spacer()
                        
                        Text("OpenTriviaDB")
                            .foregroundColor(.blue)
                            .underline(true, color: .blue)
                            .onTapGesture {
                                if let url = URL(string: "https://opentdb.com") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        
                        Spacer()
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal, 30.0)
                
                Spacer()
                
                Button("OK") {
                    withAnimation {
                        self.isShowingThisView.toggle()
                    }
                }
                .buttonStyle(QQPrimaryButtonStyle())
                .padding(.bottom, 50.0)
            }
            .navigationTitle("Special Thanks")
        }
    }
}

struct SpecialThanksView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialThanksView(isShowingThisView: .constant(true))
    }
}
