//
//  LoginView.swift
//  AIapp
//
//  Created by Murodjon Turobov on 11/06/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecured = true
    @State private var isShowingDiscoverView = false

    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    Image(.CPU_3)
                        .frame(width: 75, height: 75)
                        .padding(.top, 55)
                    Text("IMAGINE \nWITH AIKO")
                        .font(.system(size: 50))
                        .multilineTextAlignment(.center)
                    VStack(spacing: 20) {
                        
                        CustomTextField("Email address", text: $email)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                        CustomTextField("Password", text: $password)
                            .textContentType(.password)
                        
                        Button("Forgot Password?") {
                        }
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .tint(Color.primary)
                        
                        MainButton("Create") {
                           isShowingDiscoverView = true
                        }
                            .navigationDestination(isPresented: $isShowingDiscoverView) {
                                DiscoverView()
                            
                        }
                        Divider()
                        SignUpButton("Sign up with Google", .googleLogo) { }
                        SignUpButton("Sign up with Apple", .appleLogo) { }
                        
                        HStack(spacing: 40) {
                            Button("Privacy Policy")    { }
                            Button("Terms of Service")  { }
                            
                        }
                        .font(.footnote)
                        .tint(Color.primary)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 55)
            }
            .background(content: BackgroundAnimationView)
            .background(Color.mainBackground)
          
            }
        .navigationBarBackButtonHidden(true)

        }
    
    @ViewBuilder func BackgroundAnimationView() -> some View {
        IntelligenceAnimationBackground()
    }
 }
        

#Preview {
    LoginView()
}


