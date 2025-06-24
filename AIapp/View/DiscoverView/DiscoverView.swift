////
////  DiscoverView.swift
////  AIapp
////
////  Created by Murodjon Turobov on 12/06/25.
////
//
import SwiftUI

struct DiscoverView: View {
    
    @State private var showLoginView = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TopPickerView()
                    FeaturedView()
                    TrendingView()
                }
            }
            .navigationDestination(isPresented: $showLoginView) {
                     LoginView()
                 }
            .background(Color.mainBackground)
            .safeAreaPadding(.vertical, 32)
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: ToolbarContent)
            .navigationBarBackButtonHidden(true)

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
        VStack(alignment: .leading, spacing: 16) {
            TitleView("Trending") {
                // Action if needed
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(Array(stride(from: 0, to: TrendingItem.sampleData.count, by: 3)), id: \.self) { index in
                        VStack(spacing: 10) {
                            ForEach(Array(TrendingItem.sampleData[index..<min(index+3, TrendingItem.sampleData.count)])) { item in
                                TrendingAssistentView(item: item, isLastColumn: index >= TrendingItem.sampleData.count - 3)
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
    }

    @ViewBuilder func TrendingAssistentView(item: TrendingItem, isLastColumn: Bool) -> some View {
        let padding: CGFloat = isLastColumn ? 40 : 72
        let width = UIScreen.main.bounds.width - padding
        
        HStack(alignment: .top, spacing: 16) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.system(.body, weight: .semibold))
                Text(item.description)
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
                   LazyHStack(spacing: 20) {
                       ForEach(FeaturedItem.sampleData) { item in
                           FeaturedCardView(item: item)
                       }
                   }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .safeAreaPadding(.horizontal, 20)
        .safeAreaPadding(.bottom, 2)
        
    }
    
    struct FeaturedCardView: View {
        let item: FeaturedItem
        
        var body: some View {
            VStack(alignment: .leading) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    
                Text(item.title)
                    .font(.subheadline)
                    .padding(.top, 16)
                
                Text(item.description)
                    .font(.footnote)
                    .lineLimit(5)
                    .foregroundStyle(Color.secondary)
            }
            .frame(width: 150, height: 200, alignment: .top)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }
        }
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
                Button("Log out", systemImage: "arrow.right.circle.fill") {
                    showLoginView = true
                    }
                }
            }
        }
    }

#Preview {
    DiscoverView()
}
