//
//  TabBar.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 32)
        .background(Color(.black))
    }
}

enum Tab: String, CaseIterable {
    
    case Courses = "Courses"
    
    case Active = "Active"
    
    case Payment = "Payment"
    
    case Statistics = "Statistics"
    
    case Settings = "Settings"
    
}

#Preview {
    
    ContentView()
}
