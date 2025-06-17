//
//  SignUpButton.swift
//  AIapp
//
//  Created by Murodjon Turobov on 11/06/25.
//
import SwiftUI

struct SignUpButton: View {
    
    var titleKey: LocalizedStringKey
    var image: ImageResource?
    var action: () -> Void
    
    init(_ titleKey: LocalizedStringKey, _ image: ImageResource? = nil, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
        self.image = image
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(titleKey)
                if let image {
                    Image(image)
                }
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            
            
        }
        .tint(Color.primary)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .stroke(.separator)
        }
    }
}
