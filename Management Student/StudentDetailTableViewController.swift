//
//  StudentDetailTableViewController.swift
//  Management Student
//
//  Created by MrDummy on 5/10/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class StudentDetailTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var tfdName: UITextField!
    @IBOutlet weak var tfdUniversity: UITextField!
    @IBOutlet weak var tfdYearOld: UITextField!
    @IBOutlet weak var imgDetailStudent: UIImageView!
    @IBOutlet weak var tvwDescription: UITextView!
    
    var students: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfdName.text = students.name
        tfdUniversity.text = students.university
        tfdYearOld.text = students.yearold
        tvwDescription.text = students.descript
        imgDetailStudent.image = students.image
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if tfdName.text!.isEmpty || tfdUniversity.text!.isEmpty ||   tfdYearOld.text!.isEmpty {
            let alert = UIAlertController(title: "Cảnh báo", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }
        else {
            students.name = tfdName.text!
            students.university = tfdUniversity.text!
            students.yearold = tfdYearOld.text!
            students.descript = tvwDescription.text!
            students.image = imgDetailStudent.image!
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tfdName.resignFirstResponder()
        tfdUniversity.resignFirstResponder()
        tfdYearOld.resignFirstResponder()
        tvwDescription.resignFirstResponder()
    }
}
