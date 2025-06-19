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
                    TrendingView()

                    
                }
            }
            .background(Color.mainBackground)
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
    
    @ViewBuilder func TrendingView() -> some View {
        TitleView("Trending") {
            
        }
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<3, id: \.self) { i in
                    VStack {
                        ForEach(0..<3, id: \.self) { _ in
                            AssistentView(i)
                        }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .safeAreaPadding(.horizontal, 20)
    }
    
    @ViewBuilder func AssistentView(_ index: Int) -> some View {
        var width: CGFloat {
            let padding: CGFloat = index == 2 ? 40 : 72
            return  UIScreen.main.bounds.width - padding
        }
        HStack(alignment: .top, spacing: 16) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("AI Assistant")
                    .font(.system(.body, weight: .semibold))
                Text("Get help with your tasks and questions using AI.")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: width, alignment: .leading)
    }
    
    @ViewBuilder func FeaturedView() -> some View {
        
        
        TitleView("Featured") {
            
        }
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(0..<6) { _ in
                    
                    VStack(alignment: .leading) {
                        Image(.swiftUILogo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(5)
                            .background {
                                Circle()
                                    .fill(Color.green.opacity(0.2))
                                   
                            }
                        Text("Coding Tutorials")
                            .font(.subheadline)
                            .padding(.top, 12)
                        Text("Step-by-step guides on popular programming languages like Python, JavaScript, Java, C#, etc.")
                            .font(.footnote)
                            .lineLimit(5)
                            .foregroundStyle(Color.secondary)
                        
                    }
                    .frame(width: 150, height: 200)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .safeAreaPadding(.horizontal, 20)
        .safeAreaPadding(.bottom, 2)
        
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
