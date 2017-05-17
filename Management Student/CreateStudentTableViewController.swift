//
//  CreateStudentTableViewController.swift
//  Management Student
//
//  Created by MrDummy on 5/10/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class CreateStudentTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var tfdName: UITextField!
    @IBOutlet weak var tfdUniversity: UITextField!
    @IBOutlet weak var tfdYearOld: UITextField!
    @IBOutlet weak var imgStudent: UIImageView!
    @IBOutlet weak var tvwDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveAction(_ sender: Any) {
        if tfdName.text!.isEmpty || tfdUniversity.text!.isEmpty ||  tfdYearOld.text!.isEmpty || tvwDescription.text!.isEmpty || imgStudent.image == nil {
            let alert = UIAlertController(title: "Cảnh báo", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
            
        }
        else {
            Constants.isReload = true
            let student: Student = Student(nam: tfdName.text!, uni: tfdUniversity.text!, yold: tfdYearOld.text!, des: tvwDescription.text!, imaged: imgStudent.image!)
            Constants.student = student
            self.navigationController?.popViewController(animated: true)
        }
    }
        
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tfdName.resignFirstResponder()
        tfdUniversity.resignFirstResponder()
        tfdYearOld.resignFirstResponder()
        tvwDescription.resignFirstResponder()
    }
}
