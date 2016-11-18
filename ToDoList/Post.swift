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

struct Post {
    var title: String
    var description: String
    var date: String
    
    init(title: String, description: String, date: String) {
        self.title = title
        self.description = description
        self.date = date
    }
}
