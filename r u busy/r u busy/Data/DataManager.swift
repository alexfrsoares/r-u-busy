//
//  DataManager.swift
//  r u busy
//
//  Created by Alex Freitas on 02/12/21.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }

    func loadData() -> [TimeTracked] {
        let request: NSFetchRequest<TimeTracked> = TimeTracked.fetchRequest()

//        let yesterday = Date()
//        request.predicate = NSPredicate(format: "date BETWEEN %@", [yesterday.startDate(), yesterday.endDate()])

        do {
            let data = try context.fetch(request)
            return data
        } catch {
            print("Error fecthing data from context: \(error)")
        }

        return []
    }

    func deleteAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TimeTracked")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
        } catch {
            print("Error deleting data from context: \(error)")
        }
    }
}
