//
//  FeaturedItem.swift
//  AIapp
//
//  Created by Murodjon Turobov on 19/06/25.
//
import Foundation
import SwiftUI

struct FeaturedItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}

extension FeaturedItem {
    static var sampleData: [FeaturedItem] = [
        FeaturedItem(
            imageName: "FeaturedView1",
            title: "Coding Tutorials",
            description: "Step-by-step guides on popular programming languages like Python, JavaScript, Java, C#, etc."
        ),
        FeaturedItem(
            imageName: "FeaturedView2",
            title: "UI Design",
            description: "Step-by-step guides on popular programming languages!"
        ),
        FeaturedItem(
            imageName: "FeaturedView1",
            title: "Mobile Dev",
            description: "Step-by-step guides on popular programming languages like Python, JavaScript, Java, C#, etc."
        )
    ]
}
