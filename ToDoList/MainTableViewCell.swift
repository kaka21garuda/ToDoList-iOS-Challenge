//
//  MainTableViewCell.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateTheCellProtocol {
    func updateCell()
}

protocol UpdateEmojiProtocol {
    func updateEmoji(button: UIButton, newEmoji: String) -> String
}

class MainTableViewCell: UITableViewCell{
    
    var instanceOfController: MainTableViewController!
    
    
    var updateTheCellDelegate: UpdateTheCellProtocol!
    var updateEmojiDelegate: UpdateEmojiProtocol!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var emojiButton: UIButton!

    @IBAction func emojiButtonAction(_ sender: Any) {
        let newEmoji = getNewEmoji()
        updateEmojiDelegate.updateEmoji(button: emojiButton, newEmoji: newEmoji.rawValue)
        print(emojiButton.currentTitle!)
    }
    
    func getNewEmoji() -> EmojiUpdate {
        switch emojiButton.currentTitle! {
        case EmojiUpdate.tick.rawValue:
            return EmojiUpdate.cross
        case EmojiUpdate.cross.rawValue:
            return EmojiUpdate.tick
        default:
            return EmojiUpdate.cross
        }
    }
    
    
}


