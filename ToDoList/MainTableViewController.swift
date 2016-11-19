//
//  MainTableViewController.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit


class MainTableViewController: UITableViewController, AddingPostProtocol, UpdateTheCellProtocol,UpdateEmojiProtocol{
    var postArray = [
        Post(title: "Kaka", date: "15-17-2016", emoji: EmojiUpdate.tick.rawValue)
    ]
    
    func addPost(post: Post) {
        postArray.append(post)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        print(postArray[0].emoji)
        //
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell
        let oneElement = postArray[indexPath.row]
        
        cell.updateTheCellDelegate = self
        cell.updateEmojiDelegate = self
        cell.titleLabel.text = oneElement.title
        cell.dateLabel.text = "4343"
        cell.emojiButton.setTitle(oneElement.emoji, for: .normal)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: ViewController = segue.destination as! ViewController
        viewController.addingPostDelegate = self
    }
    
    func addPost(post: Post) -> [Post] {
        postArray.append(post)
        tableView.reloadData()
        return postArray
    }
    
    func updateCell() {
        //
    }
    
    func updateEmoji(button: UIButton, newEmoji: String) -> String {
        button.setTitle(newEmoji, for: .normal)
        postArray[0].emoji = newEmoji
        tableView.reloadData()
        return newEmoji
    }
}
