//
//  Student+CoreDataProperties.swift
//  MyStudents
//
//  Created by Nina Longasa on 5/10/16.
//  Copyright © 2016 CHCAppDev. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var course: String
    @NSManaged var gpa: String

}
