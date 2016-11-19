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
    var postArray = [
        Post(title: "kaka", date: "4343", emoji: .tick)
    ]
    
    
    
    override func viewDidLoad() {
        print(postArray[0].date)
        print(postArray[0].emoji)
        print(postArray[0].title)
        //
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell!
        let oneElement = postArray[indexPath.row]
        cell?.titleLabel.text = oneElement.title
        cell?.dateLabel.text = "4343"
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
    
    func updateEmoji(sender: MainTableViewCell) {
        let indexPath = tableView.indexPath(for: sender)
        //print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
        switch postArray[(indexPath?.row)!].emoji {
        case .tick:
            postArray[(indexPath?.row)!].emoji = .cross
            sender.emojiButton.setTitle(postArray[(indexPath?.row)!].emoji.rawValue, for: .normal)
            print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
        case .cross:
            postArray[(indexPath?.row)!].emoji = .tick
            print("Emoji: \(postArray[(indexPath?.row)!].emoji.rawValue)")
            sender.emojiButton.setTitle(postArray[(indexPath?.row)!].emoji.rawValue, for: .normal)
        }
    }
    
    func getNewEmoji() {
        print("This is the new Emoji!")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: ViewController = segue.destination as! ViewController
        viewController.addingPostDelegate = self
    }

}
