//
//  TrendingView.swift
//  AIapp
//
//  Created by Murodjon Turobov on 19/06/25.
//
import Foundation
import SwiftUI

struct TrendingItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

extension TrendingItem {
    
    static var sampleData: [TrendingItem] = [
        TrendingItem(
            imageName: "Trending1",
            title: "Coding Tutorials",
            description: "Python, JavaScript, Java, C#, etc!"
        ),
        TrendingItem(
            imageName: "Trending2",
            title: "UI Design",
            description: "Step-by-step guides on popular programming languages!"
        ),
        TrendingItem(
            imageName: "Trending3",
            title: "Mobile Dev",
            description: "Build apps for iOS and Android with Swift and Kotlin!"
        ),
        TrendingItem(
            imageName: "Trending3",
            title: "Coding Tutorials",
            description: "Python, JavaScript, Java, C#, etc!"
        ),
        TrendingItem(
            imageName: "Trending1",
            title: "UI Design",
            description: "Step-by-step guides on popular programming languages!"
        ),
        TrendingItem(
            imageName: "Trending2",
            title: "Mobile Dev",
            description: "Build apps for iOS and Android with Swift and Kotlin!"
        ),
        TrendingItem(
            imageName: "Trending1",
            title: "Coding Tutorials",
            description: "Python, JavaScript, Java, C#, etc!"
        ),
        TrendingItem(
            imageName: "Trending2",
            title: "UI Design",
            description: "Step-by-step guides on popular programming languages!"
        ),
        TrendingItem(
            imageName: "Trending3",
            title: "Mobile Dev",
            description: "Build apps for iOS and Android with Swift and Kotlin!"
        )
    ]
}

