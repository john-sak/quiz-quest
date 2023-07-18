//
//  QQButton.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct QQPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .fontWeight(.black)
            .padding(20)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 3)
            )
            .padding(.horizontal, 50)
            .buttonStyle(.bordered)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}

struct QQSecondaryButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .fontWeight(.heavy)
            .padding(20)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 50)
            .buttonStyle(.bordered)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}
