//
//  AikoView.swift
//  AIapp
//
//  Created by Murodjon Turobov on 18/06/25.
//

import SwiftUI

struct AikoView: View {
    @State private var userInput: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 80) {
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
                .background(Color(.secondarySystemGroupedBackground), in: .rect(cornerRadius: 20))
                .shadow(radius: 10, x: 0, y: 10)

            }
            .padding()
            .navigationTitle("Message")
            .navigationBarTitleDisplayMode(.inline)
            
            
                
            VStack {
                       HStack {
                           Image(.plusCircle)
                               .resizable()
                               .frame(width: 25, height: 25)

                           TextField("Ask Aiko...", text: $userInput)
                               .foregroundColor(.primary)
                               .padding(.horizontal, 5)

                           Image(.voiceNote)
                               .resizable()
                               .frame(width: 25, height: 25)
                       }
                       .padding(15)
                       .background {
                           RoundedRectangle(cornerRadius: 40)
                               .fill(Color(hex: "#F7D5E5"))
                               .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                               .shadow(color: Color.purple.opacity(1), radius: 15, x: 3, y: 3)
                       }
                       
                   }
                   .padding(.horizontal)
                   
               }
        .background(Color.mainBackground)
           }
    
}

#Preview {
    NavigationStack {
        AikoView()
        
    }
}
