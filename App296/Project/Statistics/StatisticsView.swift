//
//  StatisticsView.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = CoursesViewModel()
    @StateObject var paymentModel = PaymentViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    
                    VStack(alignment: .center, spacing: 4, content: {
                        
                        Text("$\(paymentModel.payments.map(\.cost).reduce(0, +))")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("Money earned")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .padding()
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    
                    VStack(alignment: .center, spacing: 4, content: {
                        
                        Text("\(viewModel.courses.count)")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("Courses sold")
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
                    
                    Text("Popular courses")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                }
                .padding([.horizontal])
                
                if viewModel.courses.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("No any popular courses")
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
            paymentModel.fetchPayments()
        }
    }
}

#Preview {
    StatisticsView()
}
