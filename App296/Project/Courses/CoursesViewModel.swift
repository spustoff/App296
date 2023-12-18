//
//  CoursesViewModel.swift
//  App296
//
//  Created by Вячеслав on 12/16/23.
//

import SwiftUI
import CoreData

final class CoursesViewModel: ObservableObject {
    
    @Published var courses: [CourseModel] = []
    
    @Published var course_name: String = ""
    @Published var cost: String = ""
    @Published var text: String = ""
    
    @Published var block_name: String = ""
    @Published var block_description: String = ""
    
    @Published var duration: String = "1 months"
    @Published var durations: [String] = ["1 months", "2 months", "3 months", "4 months", "12 months"]
    
    @Published var isAddCourse: Bool = false
    
    func addCourse() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CourseModel", into: context) as! CourseModel
        
        loan.course_name = course_name
        loan.cost = Int16(cost) ?? 0
        loan.text = text
        loan.block_name = block_name
        loan.block_description = block_description
        loan.duration = duration
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchCourses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CourseModel>(entityName: "CourseModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.courses = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.courses = []
        }
    }
}
