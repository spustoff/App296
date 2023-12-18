//
//  PaymentViewModel.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI
import CoreData

final class PaymentViewModel: ObservableObject {
    
    @Published var payments: [PaymentModel] = []
    
    @Published var date_payment: Date = Date()
    @Published var course_name: String = ""
    @Published var cost: String = ""
    
    @Published var isAddPayment: Bool = false
    
    func addPayment() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PaymentModel", into: context) as! PaymentModel
        
        loan.date_payment = date_payment
        loan.course_name = course_name
        loan.cost = Int16(cost) ?? 0
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchPayments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PaymentModel>(entityName: "PaymentModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.payments = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.payments = []
        }
    }
}
