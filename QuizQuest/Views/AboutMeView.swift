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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView(isShowingThisView: .constant(true))
    }
}
