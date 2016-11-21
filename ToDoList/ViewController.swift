//
//  ViewController.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

protocol AddingPostProtocol {
    func addPost(post: Post) -> [Post]
    func datePickerChanged(datePicker: UIDatePicker) -> String
}

class ViewController: UIViewController {
    
    var addingPostDelegate: AddingPostProtocol!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func SaveButton(_ sender: Any) {
        addingPostDelegate.addPost(post: Post(title: titleTextField.text!, date: addingPostDelegate.datePickerChanged(datePicker: datePicker)
, emoji: EmojiUpdate.tick))
        dismissViewController()
        
    }
    
    func dismissViewController() {
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

