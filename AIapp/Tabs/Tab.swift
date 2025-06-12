//
//  Tab.swift
//  AIapp
//
//  Created by Murodjon Turobov on 12/06/25.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
        }
    }
}

#Preview{
    Tab()
}
