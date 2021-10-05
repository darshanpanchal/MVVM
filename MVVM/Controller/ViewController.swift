//
//  ViewController.swift
//  MVVM
//
//  Created by Darshan on 27/09/21.
//


import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
        // Do any additional setup after loading the view.
        self.configureTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //fetch user list from server
        self.fetchUserList()
    }
    func configureTableView(){
        self.tableView.register(UINib(nibName: "UserDataViewCell", bundle: nil), forCellReuseIdentifier: "UserDataViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    //fetch User Records
    func fetchUserList(){
        ViewModel.getUserData()
        ViewModel.delegate = self
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewModel.arrayUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataViewCell", for: indexPath) as! UserDataViewCell
        cell.userModel =  ViewModel.arrayUser[indexPath.row]
        return cell
    }
}
extension ViewController:UserModelDelegate{
    func updateUserInterfaceOnUserList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


