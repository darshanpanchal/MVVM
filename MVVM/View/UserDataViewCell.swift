//
//  UserDataViewCell.swift
//  MVVM_Demo_Api
//
//  Created by IPS MAC OS 2 on 27/09/21.
//

import UIKit

class UserDataViewCell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var title: UILabel!
    var userModel:UserModel?{
        didSet{
            //setup user model data
            self.setupUserModelData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupUserModelData(){
        self.id.text = "\(userModel?.id ?? "")"
        self.userId.text = "\(userModel?.userId ?? "")"
        self.title.text = "\(userModel?.title ?? "")"
        if let  isCompleted = userModel?.completed{
            self.backgroundColor = isCompleted ? UIColor.green : UIColor.blue
        }else{
            self.backgroundColor = UIColor.blue
        }
    }
}
