//
//  MainTableViewController.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit


class MainTableViewController: UITableViewController, AddingPostProtocol, UpdateEmojiProtocol{
    var postArray = [Post]()
    
    var stringDate: String!
    
    override func viewDidLoad() {
                //
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell!
        let oneElement = postArray[indexPath.row]
        cell?.titleLabel.text = oneElement.title
        cell?.dateLabel.text = "Deadline: \(stringDate!)"
        cell?.emojiButton.setTitle(oneElement.emoji.rawValue, for: .normal)
        
        //Set the delegate property in MainTableViewCell into a self type
        cell?.updateEmojiDelegate = self
        
        return cell!
    }
    
    
    func addPost(post: Post) -> [Post] {
        postArray.append(post)
        tableView.reloadData()
        return postArray
    }
    
    func datePickerChanged(datePicker: UIDatePicker) {
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        stringDate = dateFormatter.string(from: datePicker.date)
        //postArray[0].date = stringDate
        for (index, _) in postArray.enumerated() {
            postArray[index].date = stringDate
        }
        
    }
    
    func updateEmoji(sender: MainTableViewCell) {
        let indexPath = tableView.indexPath(for: sender)
        //print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
        switch postArray[(indexPath?.row)!].emoji {
        case .tick:
            postArray[(indexPath?.row)!].emoji = .cross
            sender.emojiButton.setTitle(postArray[(indexPath?.row)!].emoji.rawValue, for: .normal)
            sender.dateLabel.textColor = UIColor.green
            sender.dateLabel.text = "You are done here 💪"
            print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
        case .cross:
            postArray[(indexPath?.row)!].emoji = .tick
            print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
            sender.emojiButton.setTitle(postArray[(indexPath?.row)!].emoji.rawValue, for: .normal)
            sender.dateLabel.textColor = UIColor.red
            sender.dateLabel.text = "Deadline: \(postArray[(indexPath?.row)!].date)"
        }
    }
    
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: ViewController = segue.destination as! ViewController
        viewController.addingPostDelegate = self
    }

}
