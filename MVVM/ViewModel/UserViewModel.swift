//
//  UserViewModel.swift
//  MVVM_Demo_Api
//
//  Created by IPS MAC OS 2 on 23/09/21.
//

import UIKit
import Alamofire
//POP
protocol UserModelDelegate{
    func updateUserInterfaceOnUserList()
}
class UserViewModel{
    internal var arrayUser:[UserModel] = []
    
    internal var arrayPeople:[String] = []
    
    internal var delegate:UserModelDelegate?
    
    static let shared = UserViewModel()
    
    private init(){}
    
    func getUserData(){
        AF.request("\(kGETUserList)").response{
            response in
            if let data = response.data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    if let jsonObj = json as? NSArray{
                        for jsonData in jsonObj{
                            print(jsonData)
                            self.arrayUser.append(UserModel.init(userData: jsonData as! [String:Any]))
                            DispatchQueue.main.async {
                                self.delegate?.updateUserInterfaceOnUserList()
                            }
                        }
                    }
                } catch  {
                    print(error)
                }
            }
        }
    }
}
