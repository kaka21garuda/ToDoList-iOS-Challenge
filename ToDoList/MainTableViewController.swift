//
//  MainTableViewController.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit

protocol CheckEmojiProtocol {
    func elementInPostArray(indexOfArray: Int)
}

class MainTableViewController: UITableViewController, AddingPostProtocol, UpdateEmojiProtocol, ChangeTheEmojiProtocol{
    var showCellInstance: ShowCellViewController!
    
    var checkEmojiDelegate: CheckEmojiProtocol!
    //postArray is where all the notes are stored.
    var postArray = [Post]()
    
    var finalDate: String!
    var stringDate: String!
    //the index of which element in posArray is being selected.
    var indexpathRow: Int!
    
    //Return the number of cell in tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell!
        let oneElement = postArray[indexPath.row]
        cell?.titleLabel.text = oneElement.title
        cell?.emojiButton.setTitle(oneElement.emoji.rawValue, for: .normal)
        if cell?.emojiButton.currentTitle == EmojiUpdate.tick.rawValue {
            cell?.dateLabel.text = "Deadline: \(oneElement.date)"
            cell?.dateLabel.textColor = UIColor.red
        } else {
            cell?.dateLabel.text = oneElement.doneString
            cell?.dateLabel.textColor = UIColor.green
        }
        //Set the delegate property in MainTableViewCell into a self type
        cell?.updateEmojiDelegate = self
        
        return cell!
    }
    //Select the element in postAray and stored the index value into indexpathRow variable.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexpathRow = indexPath.row
    }
    //this is a delegate function from AddingPostProtocol, in order to append newElement into postArray.
    func addPost(post: Post) -> [Post] {
        postArray.append(post)
        tableView.reloadData()
        return postArray
    }
    
    func datePickerChanged(datePicker: UIDatePicker) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        //Stored the value from datePicker into
        stringDate = dateFormatter.string(from: datePicker.date)
        //finalDate = stringDate
        return stringDate
    }
    
    func changeTheEmoji() -> EmojiUpdate {
        switch postArray[indexpathRow].emoji {
        case .cross:
            postArray[indexpathRow].emoji = .tick
             tableView.reloadData()
            return .tick
        case .tick:
            postArray[indexpathRow].emoji = .cross
             tableView.reloadData()
            return .cross
        }
    }
    
    //This is a function from UpdateEmojiProtocol, to check what is the current emoji in the tableViewCell and change the emoji if the user tapped the emojiButton.
    func updateEmoji(sender: MainTableViewCell) {
        let indexPath = tableView.indexPath(for: sender)
        switch postArray[(indexPath?.row)!].emoji {
        case .tick:
            //change the emoji of the specific postArray element with the new emoji
            postArray[(indexPath?.row)!].emoji = .cross
            print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
            sender.emojiButton.setTitle(postArray[(indexPath?.row)!].emoji.rawValue, for: .normal)
            sender.dateLabel.textColor = UIColor.green
            sender.dateLabel.text = postArray[(indexPath?.row)!].doneString
            
        case .cross:
            //change the emoji of the specific postArray element with the new emoji
            postArray[(indexPath?.row)!].emoji = .tick
            print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
            sender.emojiButton.setTitle(postArray[(indexPath?.row)!].emoji.rawValue, for: .normal)
            sender.dateLabel.textColor = UIColor.red
            sender.dateLabel.text = "Deadline: \(postArray[(indexPath?.row)!].date)"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToViewController" {
            let viewController: ViewController = segue.destination as! ViewController
            viewController.addingPostDelegate = self
        } else if segue.identifier == "showCellSegue" {
            let showCellView: ShowCellViewController = segue.destination as! ShowCellViewController
            showCellView.instanceController = self
            showCellView.emojiDelegate = self
        }
    }
}
