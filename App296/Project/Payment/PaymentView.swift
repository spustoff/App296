//
//  PaymentView.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI

struct PaymentView: View {
    
    @StateObject var viewModel = PaymentViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text(Date().convertDate(format: "MMM d Y"))
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 15, weight: .regular))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        PaymentGraph()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("EUR/USD")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                }
                .padding()
                
                VStack(alignment: .center, spacing: 4, content: {
                    
                    Text("$\(viewModel.payments.map(\.cost).reduce(0, +))")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 19, weight: .semibold))
                    
                    Text("Earned for current month")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                })
                .padding()
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                HStack {
                    
                    Text("Payment")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAddPayment = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    })
                }
                .padding()
                
                if viewModel.payments.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Add your first payout")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxHeight: .infinity, alignment: .center)
                    })
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.payments, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 6, content: {
                                        
                                        Text("$\(index.cost)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text(index.course_name ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                    })
                                    
                                    Spacer()
                                    
                                    Text((index.date_payment ?? Date()).convertDate(format: "MMM d y"))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 17, weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchPayments()
        }
        .sheet(isPresented: $viewModel.isAddPayment, content: {
            
            PaymentAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    PaymentView()
}
