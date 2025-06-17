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
                VStack {
                    TopPickerView()
                    FeaturedView()
                    
                }
            }
            .safeAreaPadding(.vertical, 32)
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: ToolbarContent)
        }
    }
    
    @ViewBuilder func TopPickerView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                Button("Productivity") {
                    
                }
                Divider()
                Button("Top Picks") {
                    
                }
                Divider()
                Button("LifeStyle") {
                    
                }
                Divider()
                Button("Education") {
                    
                }
            }
            .padding(.leading, 15)
            .foregroundColor(.primary)
            .font(.system(size: 15))
        }
        .overlay {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(.systemBackground), location: 0),
                    Gradient.Stop(color: Color.clear, location: 0.2),
                    Gradient.Stop(color: Color.clear, location: 0.8),
                    Gradient.Stop(color: Color(.systemBackground), location: 1),
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
            .allowsHitTesting(false)
        }
    }
    
    @ViewBuilder func FeaturedView() -> some View {
        TitleView("Featured") {
            
        }
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(0..<6) { _ in
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 150, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .safeAreaPadding(.horizontal, 20)
    }
    
    
    @ViewBuilder func TitleView(_ title: LocalizedStringKey, action: @MainActor @escaping () -> ()) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(Color.secondary)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(Color.gray.opacity(0.5))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .fontWeight(.bold)
            }
            .padding(.leading, 20)
            .padding(.trailing, 10)
        }
        
    }
    
    @ToolbarContentBuilder func ToolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Sidebar", systemImage: "line.2.horizontal.decrease.circle.fill") {
                
            }
        }
        ToolbarItem(placement: .principal) {
            Text("Discover")
                .font(.system(.title, design: .rounded, weight: .bold))
        }
        ToolbarItem(placement: .topBarTrailing) {
            Menu("More", systemImage: "ellipsis.circle.fill") {
                Button("Settings", systemImage: "gearshape.fill") {}
                Button("Share", systemImage: "square.and.arrow.up") {}
            }
        }
    }
}


#Preview {
    DiscoverView()
}
