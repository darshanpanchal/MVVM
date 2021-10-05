//
//  UserModel.swift
//  MVVM
//
//  Created by IPS MAC OS 2 on 05/10/21.
//

import UIKit

class UserModel:Codable{
    var id = ""
    var title:String = ""
    var userId:String = ""
    var completed:Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case userId = "userId"
        case completed
    }
    init(userData:[String:Any]){
        
        if let value = userData[CodingKeys.id.rawValue],!(value is NSNull){
            self.id = "\(value)"
        }
        if let value = userData[CodingKeys.userId.rawValue],!(value is NSNull){
            self.userId = "\(value)"
        }
        if let value = userData[CodingKeys.title.rawValue],!(value is NSNull){
            self.title = "\(value)"
        }
        if let value = userData[CodingKeys.completed.rawValue],!(value is NSNull), let updatedvalue = value as? Bool{
            self.completed = updatedvalue
        }
        
    }
}
