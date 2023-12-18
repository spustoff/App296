//
//  PaymentAdd.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct PaymentAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: PaymentViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Payment")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        HStack {
                            
                            Text("Date of payment")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            DatePicker(selection: $viewModel.date_payment, displayedComponents: .date, label: {})
                                .labelsHidden()
                            
                            Spacer()
                        }
                        
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
                    }
                    .padding([.horizontal, .bottom])
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addPayment()
                    viewModel.fetchPayments()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.course_name.isEmpty || viewModel.cost.isEmpty ? 0.5 : 1)
                .disabled(viewModel.course_name.isEmpty || viewModel.cost.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    PaymentAdd(viewModel: PaymentViewModel())
}
