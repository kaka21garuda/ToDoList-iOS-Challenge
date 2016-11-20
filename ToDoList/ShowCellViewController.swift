//
//  ShowCellViewController.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/19/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit


class ShowCellViewController: UIViewController {
    
    var instanceController: MainTableViewController!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionButton: UIButton!


    @IBAction func descriptionButtonAction(_ sender: Any) {
        
    }

    @IBAction func deleteAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        titleLabel.text = instanceController.postArray[instanceController.IndexpathRow].date
    }

}
