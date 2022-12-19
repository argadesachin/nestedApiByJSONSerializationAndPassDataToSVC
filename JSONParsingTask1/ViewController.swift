//
//  ViewController.swift
//  JSONParsingTask1
//
//  Created by Mac on 19/11/22.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
  
    @IBOutlet weak var tableViewToDisplayOnFvc: UITableView!
    var users = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDataAndDelegate()
        registerNib()
        fetchingAPI()
    }
    
    func initDataAndDelegate(){
        tableViewToDisplayOnFvc.dataSource = self
        tableViewToDisplayOnFvc.delegate = self
    }
    
    func registerNib(){
        let nibName = UINib(nibName: "Task1TableViewCell", bundle: nil)
        self.tableViewToDisplayOnFvc.register(nibName, forCellReuseIdentifier: "Task1TableViewCell")
    }
    
// MARK - fetching api through serialization
    func fetchingAPI(){
        let urlString =  "https://reqres.in/api/users?page=2"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let  dataTask = session.dataTask(with: request){ data,response,error in
            print("Data\(data)")
            print("response\(response)")
            let getJSONObject = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            
            var dataFromJson = NSArray()
            
            dataFromJson = getJSONObject["data"] as! NSArray
            print(dataFromJson)
            
            for dictionary in dataFromJson {
                let eachDictionary = dictionary as! [String:Any]
                let userId = eachDictionary["id"] as! Int
                let userEmail = eachDictionary["email"] as! String
                let userfirstname = eachDictionary["first_name"] as! String
                let userlastname = eachDictionary["last_name"] as! String
                let userImage1 = eachDictionary["avatar"] as! String
                
                let newUser = Data(Id: userId, Email: userEmail, firstName: userfirstname, lastName: userlastname, image1: userImage1)
                self.users.append(newUser)
            }
            DispatchQueue.main.async {
            self.tableViewToDisplayOnFvc.reloadData()
            }
        }
        dataTask.resume()
    }
}

// MARK - view class conform to UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userTableViewCell = self.tableViewToDisplayOnFvc.dequeueReusableCell(withIdentifier: "Task1TableViewCell", for: indexPath) as! Task1TableViewCell
        
        let imgurl = NSURL(string: users[indexPath.row].image1)
        userTableViewCell.imageView1.sd_setImage(with: imgurl as URL?)
        
        userTableViewCell.task1IdLabel.text = String(users[indexPath.row].Id)
        userTableViewCell.task1EmailLabel.text = users[indexPath.row].Email
        return userTableViewCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let svc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
       
        svc.id = self.users[indexPath.row].Id
        svc.email = self.users[indexPath.row].Email
        svc.firstName = self.users[indexPath.row].firstName
        svc.lastName = self.users[indexPath.row].lastName
        svc.imgurl = self.users[indexPath.row].image1
        
        navigationController?.pushViewController(svc, animated: true)
    }
}

// MARK - view controller class conform to UITableViewDelegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

