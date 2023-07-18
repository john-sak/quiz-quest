//
//  QQButton.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

let buttonCornerRadius: CGFloat = 8
let paddingLevel1: Double = 20
let paddingLevel2: Double = 50
let opacityWhenPressed: Double = 0.4
let overlayLineWidth: CGFloat = 3

struct QQPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .fontWeight(.black)
            .padding(paddingLevel1)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor.opacity(configuration.isPressed ? opacityWhenPressed : 0))
            .cornerRadius(buttonCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: buttonCornerRadius)
                    .stroke(Color.accentColor, lineWidth: overlayLineWidth)
            )
            .padding(.horizontal, paddingLevel2)
            .buttonStyle(.bordered)
    }
}

struct QQSecondaryButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .fontWeight(.semibold)
            .padding(paddingLevel1)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor.opacity(configuration.isPressed ? opacityWhenPressed : 0))
            .cornerRadius(buttonCornerRadius)
            .padding(.horizontal, paddingLevel2)
            .buttonStyle(.bordered)
    }
}
