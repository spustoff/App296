//
//  ActiveView.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct ActiveView: View {

    @StateObject var viewModel = CoursesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Active")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                if viewModel.courses.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("No active courses found")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxHeight: .infinity, alignment: .center)
                    })
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.courses, id: \.self) { index in
                            
                                NavigationLink(destination: {
                                    
                                    CourseDetail(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 15, content: {
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            Text("Course name")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text(index.course_name ?? "")
                                                .foregroundColor(Color("primary"))
                                                .font(.system(size: 22, weight: .semibold))
                                        })
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 5, content: {
                                                
                                                Text("Cost")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("$\(index.cost)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .semibold))
                                            })
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .trailing, spacing: 5, content: {
                                                
                                                Text("Duration")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.duration ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                            })
                                        }
                                    })
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                })
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchCourses()
        }
    }
}

#Preview {
    ActiveView()
}
