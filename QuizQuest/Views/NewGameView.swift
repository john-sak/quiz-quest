//
//  NewGameView.swift
//  QuizQuest
//
//  Created by Ioannis Sakarellos on 18/7/23.
//

import SwiftUI

struct NewGameView: View {
    @Binding var isShowingThisView: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView(isShowingThisView: .constant(true))
    }
}
