//
//  SpecialThanksView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct AcknowledgmentsView: View {
    @Binding var isShowingThisView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Special thanks to OpenTriviaDB!")
                        .fontWeight(.bold)
                        .padding()
                        
                    Text("Their free database and API have been instrumental in providing a diverse range of engaging trivia questions, enhancing the user experience.")
                        .padding(.horizontal)
                        .padding(.vertical)
                    Text("Their generosity and commitment to knowledge sharing have made a significant impact on my project, allowing me to deliver a captivating trivia experience to my users.")
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                    Text("🎉Thank you, OpenTriviaDB✨")
                        .fontWeight(.bold)
                        .padding()
                }
                .padding(.horizontal, 30.0)
                .padding(.vertical)
                .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack{
                    Button("OpenTriviaDB's website") {
                        if let url = URL(string: "https://opentdb.com") {
                            if (UIApplication.shared.canOpenURL(url)) {
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
            .navigationTitle("Acknowledgements")
        }
    }
}

struct SpecialThanksView_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgmentsView(isShowingThisView: .constant(true))
    }
}
