//
//  CourseDetail.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct CourseDetail: View {
    
    let index: CourseModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        Text(index.course_name ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 4, content: {
                                
                                Text("Cost")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("$\(index.cost)")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 19, weight: .semibold))
                            })
                            .padding()
                            .padding(.vertical, 30)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            
                            VStack(alignment: .center, spacing: 4, content: {
                                
                                Text("Duration")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(index.duration ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                            })
                            .padding()
                            .padding(.vertical, 30)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        }
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text(index.text ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .multilineTextAlignment(.leading)
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Course Blocks")
                                .foregroundColor(.white)
                                .font(.system(size: 21, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        VStack(alignment: .leading, spacing: 13, content: {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Block 1")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text(index.block_name ?? "")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 19, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                            })
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text(index.block_description ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 19, weight: .regular))
                                    .multilineTextAlignment(.leading)
                            })
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    CourseDetail()
//}
