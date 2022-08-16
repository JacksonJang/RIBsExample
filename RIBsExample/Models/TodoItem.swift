//
//  TodoItem.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/16.
//

import Foundation

struct TodoItem: Codable {
    let id: String
    let title:String
    
    init(id:String = UUID().uuidString, title:String) {
        self.id = id
        self.title = title
    }
}
