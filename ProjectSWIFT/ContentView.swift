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
            HStack {
                btn(anim: .spring(), isExpanded: $isExp, text: "Spring")
                btn(anim: .bouncy, isExpanded: $isExp, text: "Bouncy")
            }
        }
    }
}

struct btn: View {
    var anim: Animation
    @Binding var isExpanded: Bool
    @State private var color = btn.randomColor()
    var text: String
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(color)
                .frame(width: isExpanded ? 200 : 100, height: isExpanded ? 200 : 100)
                
            
            Button(action: {
                withAnimation(anim) {
                    isExpanded.toggle()
                    color = btn.randomColor()
                }
            }) {
                Text(text)
            }
        }.animation(anim, value: isExpanded)
    }
    
    static func randomColor() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

#Preview {
    ContentView()
}
