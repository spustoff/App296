//
//  SettingsView.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Rate app")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1PVxPaBwIs2lHphd77U9uJ9uLHzEUOjr5ESbhjRLclgc/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
