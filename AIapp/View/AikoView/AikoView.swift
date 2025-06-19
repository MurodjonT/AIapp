//
//  AikoView.swift
//  AIapp
//
//  Created by Murodjon Turobov on 18/06/25.
//

import SwiftUI

struct AikoView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Where your imagination can create")
                
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                VStack(spacing: 30) {
                    HStack {
                        HStack {
                            Image(.figmaLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Master UI design techniques now")
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                            
                            Divider()
                            Image(.swiftUILogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Explore dynamic animations in Figma")
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Divider()
                        .padding(.horizontal, 60)
                    HStack {
                        HStack {
                            Image(.swiftUILogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Explore dynamic animations in Figma")
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                            Divider()
                            Image(.figmaLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                            Text("Explore dynamic animations in Figma")
                                .font(.subheadline)
                                .lineLimit(2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 30)
                
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .stroke(.secondary.opacity(0.1), lineWidth: 1)
                }
                .padding(.top, 80)
            }
            .padding()
            .navigationTitle("Message")
            .navigationBarTitleDisplayMode(.inline)
            
            
                
            HStack(spacing: 100) {
                Image(.plusCircle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                Text("Ask Aiko...")
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                Image(.voiceNote)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
            }
            .padding(15)
            .background {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color(hex: "#F7D5E5"))
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    .shadow(color: Color.purple.opacity(1), radius: 15, x: 3, y: 3)
                    
            }
            .padding(.top, 150)
            
        }

        .background(Color.mainBackground)
        
      
    }
    
    
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    NavigationStack {
        AikoView()
        
    }
}
