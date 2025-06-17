//
//  IntelegenceAnimationBackground.swift
//  AIapp
//
//  Created by Murodjon Turobov on 17/06/25.
//

import SwiftUI

struct IntelligenceAnimationBackground: View {
    
    @State private var colors: [Color] = []
    
    var body: some View {
        AngularGradient(colors: colors, center: .center)
            .mask {
                ZStack {
                    Rectangle()
                    RoundedRectangle(cornerRadius: 90)
                        .blur(radius: 15, opaque: false)
                        .blendMode(.destinationOut)
                }
                .compositingGroup()
            }
            .ignoresSafeArea()
            .onAppear {
                generateShuffledColors()
                animateColors()
            }
    }
    
    func generateShuffledColors() {
        let baseColors: [Color] = [.red, .purple, .yellow, .green, .orange]
        let shuffled = baseColors.shuffled()
        let start = shuffled.first!
        let middle = Array(shuffled)
        colors = [start] + middle + [start]
    }
    
    func animateColors() {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            withAnimation(.linear(duration: 1.5)) {
                generateShuffledColors()
            }
        }
    }
}



#Preview {
    IntelligenceAnimationBackground()
}
