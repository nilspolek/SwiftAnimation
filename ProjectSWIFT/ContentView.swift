//
//  ContentView.swift
//  ProjectSWIFT
//
//  Created by Nils Polek on 19.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var isExp = false

    var body: some View {
        VStack {
            HStack {
                btn(anim: .linear(duration: 3), isExpanded: $isExp, text: "Linear")
                btn(anim: .easeIn(duration: 3), isExpanded: $isExp, text: "Ease In")
            }
            HStack {
                btn(anim: .easeOut(duration: 3), isExpanded: $isExp, text: "Ease Out")
                btn(anim: .easeInOut(duration: 3), isExpanded: $isExp, text: "Ease InOut")
            }
        }
    }
}

struct btn: View {
    var anim: Animation
    @Binding var isExpanded: Bool
    var text: String
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: isExpanded ? 200 : 100, height: isExpanded ? 200 : 100)
                .animation(anim, value: isExpanded)
            
            Button(action: {
                withAnimation(anim) {
                    isExpanded.toggle()
                }
            }) {
                Text(text)
            }
        }
    }
}

#Preview {
    ContentView()
}

