//
//  LocalManager.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/16.
//

import Foundation

enum KeyType: String {
    case todoList = "todoList"
}

class LocalManager: NSObject {
    static let shared = LocalManager()
    
    public func save(value:Any?, key:KeyType) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    public func getTodoList() -> Data {
        let key = KeyType.todoList.rawValue
        
        if let data = UserDefaults.standard.data(forKey: key) {
            return data
        }
            
        return Data()
    }
}
