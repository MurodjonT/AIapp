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
            LoginView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            LoginView()
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
