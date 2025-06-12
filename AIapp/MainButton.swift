//
//  MainButton.swift
//  AIapp
//
//  Created by Murodjon Turobov on 11/06/25.
//
import SwiftUI

struct MainButton: View {
    var titleKey: LocalizedStringKey
    var action: () -> Void
    
    init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(titleKey)
                Image(systemName: "chevron.right")
 
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            
        }
        .buttonStyle(.borderedProminent)
        .foregroundStyle(Color.white)
        .clipShape(.rect(cornerRadius: 12))
    }
}
