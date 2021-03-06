//
//  MainTableViewCell.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit


protocol UpdateEmojiProtocol {
    func updateEmoji(sender: MainTableViewCell)
}

class MainTableViewCell: UITableViewCell{
    
    var updateEmojiDelegate: UpdateEmojiProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var emojiButton: UIButton!
    
    @IBAction func emojiButtonAction(_ sender: Any) {
        
        updateEmojiDelegate?.updateEmoji(sender: self)
        
    }
}


