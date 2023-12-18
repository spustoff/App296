//
//  CourseAdd.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct CourseAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: CoursesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Courses")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        HStack {
                            
                            Text("Course name")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.course_name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.course_name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Duration")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            Menu {
                                    
                                ForEach(viewModel.durations, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.duration = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index)
                                            
                                            Spacer()
                                            
                                            if viewModel.duration == index {
                                                
                                                Image(systemName: "xmark")
                                            }
                                        }
                                    })
                                }
                                
                            } label: {
                                
                                Text(viewModel.duration)
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(7)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            
                            Text("Cost")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$ Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cost.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cost)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Description")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.text.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.text)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        Text("Course Block")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Text("Block name")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.block_name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.block_name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Block description")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.block_description.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.block_description)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    }
                    .padding([.horizontal, .bottom])
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addCourse()
                    viewModel.fetchCourses()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.course_name.isEmpty || viewModel.cost.isEmpty || viewModel.text.isEmpty || viewModel.block_name.isEmpty || viewModel.block_description.isEmpty ? 0.5 : 1)
                .disabled(viewModel.course_name.isEmpty || viewModel.cost.isEmpty || viewModel.text.isEmpty || viewModel.block_name.isEmpty || viewModel.block_description.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    CourseAdd(viewModel: CoursesViewModel())
}
