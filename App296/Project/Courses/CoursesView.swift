//
//  CoursesView.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct CoursesView: View {
    
    @StateObject var viewModel = CoursesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    VStack(alignment: .center, spacing: 4, content: {
                        
                        Text("\(viewModel.courses.count)")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("Number of courses")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .padding()
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    
                    VStack(alignment: .center, spacing: 4, content: {
                        
                        Text("$\(viewModel.courses.map(\.cost).reduce(0, +))")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("Cost of the courses")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .padding()
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                }
                .padding()
                
                HStack {
                    
                    Text("Courses")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAddCourse = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    })
                }
                .padding()
                
                if viewModel.courses.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Add your first course")
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
        .sheet(isPresented: $viewModel.isAddCourse, content: {
            
            CourseAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    CoursesView()
}
