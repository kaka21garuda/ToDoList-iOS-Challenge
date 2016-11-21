//
//  ShowCellViewController.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/19/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit

protocol ChangeTheEmojiProtocol {
    func changeTheEmoji() -> EmojiUpdate
}


class ShowCellViewController: UIViewController{
    var instanceController: MainTableViewController!
    
    var emojiDelegate: ChangeTheEmojiProtocol!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionButton: UIButton!


    @IBAction func descriptionButtonAction(_ sender: Any) {
        if emojiDelegate.changeTheEmoji() == .tick {
            titleLabel.text = "Deadline: \(instanceController.postArray[instanceController.indexpathRow].date)"
            titleLabel.textColor = UIColor.red
            descriptionButton.setTitle("Mark as Done \(instanceController.postArray[instanceController.indexpathRow].emoji.rawValue)", for: .normal)
        } else {
            titleLabel.text = instanceController.postArray[instanceController.indexpathRow].doneString
            titleLabel.textColor = UIColor.green
            descriptionButton.setTitle("Mark as Undone \(instanceController.postArray[instanceController.indexpathRow].emoji.rawValue)", for: .normal)
        }
    }

    @IBAction func deleteAction(_ sender: Any) {
        instanceController.postArray.remove(at: instanceController.indexpathRow)
        instanceController.tableView.reloadData()
        print("Deleted")
    }
    
    
    
    override func viewDidLoad() {
        instanceController.showCellInstance = self
//        titleLabel.text = instanceController.postArray[0].doneString
        if instanceController.postArray[instanceController.indexpathRow].emoji == .tick {
            titleLabel.text = "Deadline: \(instanceController.postArray[instanceController.indexpathRow].date)"
            titleLabel.textColor = UIColor.red
            descriptionButton.setTitle("Mark as Done \(instanceController.postArray[instanceController.indexpathRow].emoji.rawValue)", for: .normal)
        } else {
            titleLabel.text = instanceController.postArray[instanceController.indexpathRow].doneString
            titleLabel.textColor = UIColor.green
            descriptionButton.setTitle("Mark as Undone \(instanceController.postArray[instanceController.indexpathRow].emoji.rawValue)", for: .normal)
        }
    }
    
    
}
