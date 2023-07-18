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
                
                Text("Placeholder")
                
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
