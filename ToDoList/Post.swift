//
//  Post.swift
//  ToDoList
//
//  Created by Buka Cakrawala on 11/18/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

enum EmojiUpdate: String {
    case cross = "❗️"
    case tick = "✅"
}

import Foundation

class Post {
    var title: String
    var date: String
    var emoji: String
    
    init(title: String, date: String, emoji: String) {
        self.title = title
        self.date = date
        self.emoji = emoji
    }
}
