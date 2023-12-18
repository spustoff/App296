//
//  Users_2.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_2")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 6, content: {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Help make the app even better")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Users_3(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                    }
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2(telegram: URL(string: "h")!, isTelegram: false)
}
