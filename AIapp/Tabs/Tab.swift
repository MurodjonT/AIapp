//
//  Tab.swift
//  AIapp
//
//  Created by Murodjon Turobov on 12/06/25.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var selectedItem: TabItem = .Discover
    var body: some View {
        VStack {
            TabView(selection: $selectedItem) {
                DiscoverView()
                AikoView()
                FavoritesView()
            }
            HStack {
                TabItemView(systemName: "house.fill", tab: .Discover)
                TabItemView(systemName: "message.fill", tab: .Aiko)
                TabItemView(systemName: "star.fill", tab: .Collection)
                
            }
            
        }
    }
    
    @ViewBuilder func TabItemView(systemName: String, tab: TabItem) -> some View {
        Button {
            selectedItem = tab
        } label: {
            
            Image(systemName: systemName)
                .padding(.horizontal, 30)
                .font(.title)
                .foregroundColor(selectedItem == tab ? .blue : .gray)
                .background(selectedItem == tab ? Color.white : .clear)
//                .safeAreaPadding(.vertical, /*10*/)
        }
    }
}
struct FavoritesView: View {
    var body: some View {
        Text("Favorites")
    }
    
}
enum TabItem: String {
    case Discover
    case Aiko
    case Collection
    case Profile
}
#Preview{
    TabbarView()
}
