//
//  Reviewers_3.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct Reviewers_3: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_3")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 6, content: {
                    
                    Text("Full control of statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("The most popular courses are gathered here")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .padding(.top, 20)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    }
}

#Preview {
    Reviewers_3()
}
