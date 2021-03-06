//
//  StudentDetailViewController.swift
//  MyStudents
//
//  Created by Nina Longasa on 5/10/16.
//  Copyright © 2016 CHCAppDev. All rights reserved.
//

import UIKit
import CoreData

class StudentDetailViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var selectedStudent: Student?
    var student: Student?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var gpaTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedStudent = selectedStudent {
        
            firstNameTextField.text = selectedStudent.firstName
            lastNameTextField.text = selectedStudent.lastName
            courseTextField.text = selectedStudent.course
            gpaTextField.text = selectedStudent.gpa
            
            title = "Update Student"
        } else {
            title = "Add Student"
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        if let selectedStudent = selectedStudent, firstName = firstNameTextField.text, lastName = lastNameTextField.text, course = courseTextField.text, gpa = gpaTextField.text {
            
                selectedStudent.firstName = firstName
                selectedStudent.lastName = lastName
                selectedStudent.course = course
                selectedStudent.gpa = gpa
            
        } else if selectedStudent == nil {
            
            if let firstName = firstNameTextField.text, lastName = lastNameTextField.text, course = courseTextField.text, gpa = gpaTextField.text, entity = NSEntityDescription.entityForName("Student", inManagedObjectContext: managedObjectContext) where !firstName.isEmpty && !lastName.isEmpty && !course.isEmpty && !gpa.isEmpty {
                
                student = Student(entity: entity, insertIntoManagedObjectContext:  managedObjectContext)
                
                    student?.firstName = firstName
                    student?.lastName = lastName
                    student?.course = course
                    student?.gpa = gpa
            }
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving the managed object context!")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
