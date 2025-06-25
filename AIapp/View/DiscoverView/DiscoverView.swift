////
////  DiscoverView.swift
////  AIapp
////
////  Created by Murodjon Turobov on 12/06/25.
////
//
import SwiftUI

struct DiscoverView: View {
    
    @State private var isTopPickerScrolling: Bool = false
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
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder func TopPickerView() -> some View {
        ScrollView(.horizontal) {
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
            .tint(Color.primary)
            .padding(.horizontal)
            .font(.system(size: 15))
            .background {
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .named("TopPickerView")).minX
                    Color.clear
                        .onChange(of: minX) { oldValue, newValue in
                            isTopPickerScrolling = newValue < 0
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
        .coordinateSpace(name: "TopPickerView")
        .overlay {
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    if isTopPickerScrolling {
                        LinearGradient(colors: [Color.mainBackground, Color.clear], startPoint: .leading, endPoint: .trailing)
                            .frame(width: proxy.size.width * 0.1)
                    }
                    Spacer()
                    LinearGradient(colors: [Color.mainBackground, Color.clear], startPoint: .trailing, endPoint: .leading)
                        .frame(width: proxy.size.width * 0.1)
                }
                .ignoresSafeArea()
                .allowsHitTesting(false)
            }
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
        let width = UIScreen.main.bounds.width - (isLastColumn ? 40 : 72)
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
        VStack(alignment: .leading, spacing: 16) {
            TitleView("Featured") {
                
            }
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(FeaturedItem.sampleData) { item in
                        FeaturedCardView(item)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollClipDisabled(true)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .safeAreaPadding(.horizontal, 20)
        }
    }
    
    @ViewBuilder func FeaturedCardView(_ item: FeaturedItem) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.subheadline)
                Text(item.description)
                    .font(.footnote)
                    .lineLimit(5)
                    .foregroundStyle(Color.secondary)
            }
        }
        .padding()
        .frame(width: (UIScreen.main.bounds.width - 40) / 2, alignment: .topLeading)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color(.secondarySystemGroupedBackground), in: .rect(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
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
                Button("Logout", systemImage: "arrow.right.circle.fill") {
                    showLoginView = true
                }
                
            }
        }
    }
}

#Preview {
    DiscoverView()
}
