////
////  DiscoverView.swift
////  AIapp
////
////  Created by Murodjon Turobov on 12/06/25.
////
//
import SwiftUI

struct DiscoverView: View {
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        
                        Button("Productivity") {
                            
                        }
                        Rectangle()
                            .frame(width: 0.5, height: 24)
                                    .foregroundColor(.gray)
                        Button("Top Picks") {
                           
                        }
                        Rectangle()
                            .frame(width: 0.5, height: 24)
                                    .foregroundColor(.gray)
                        Button("LifeStyle") {
                           
                        }
                        Rectangle()
                            .frame(width: 0.5, height: 24)
                                    .foregroundColor(.gray)
                        Button("Education") {
                            
                        }
                    }
                    .padding(.leading, 15)
                    .foregroundColor(.primary)
                    .font(.system(size: 15))
                }
                   
                    HStack {
                
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .frame(width: 90)
                
                                    Spacer()
                
                
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white.opacity(0), Color.white]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .frame(width: 90)
                                }
            
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Action for the button
                        }) {
                            Image("More Circle")
                                .foregroundColor(.primary)
                                .frame(width: 34, height: 34)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Discover")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Action for the button
                        }) {
                            Image("Side Menu")
                                .frame(width: 34, height: 34)
                                .foregroundColor(.primary)
                        }
                    }
                }
                
                HStack {
                    Text("Featured")
                        .font(.system(size: 35, weight: .bold))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 30, height: 30)
                }
                .padding(.top, 20)
                .padding(.horizontal, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(0..<6) { _ in
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 150, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                
                        }
                    }
                    .padding(.leading, 15)
                }
                
                HStack {
                    Text("Trending")
                        .font(.system(size: 35, weight: .bold))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 30, height: 30)
                }
                .padding(.top, 20)
                .padding(.horizontal, 15)
                
            }
        }
    }
}

#Preview {
    DiscoverView()
}
