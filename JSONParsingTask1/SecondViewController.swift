//
//  SecondViewController.swift
//  JSONParsingTask1
//
//  Created by Mac on 21/11/22.
//

import UIKit
import SDWebImage
class SecondViewController: UIViewController {
    
    
    @IBOutlet var imgOnSvc: UIImageView!
    
    @IBOutlet var idLabelOnSvc: UILabel!
    
    @IBOutlet var emailLabelOnSvc: UILabel!
    
    @IBOutlet var firstNameOnSvc: UILabel!
    
    @IBOutlet var lastNameOnSvc: UILabel!
    
    var id = Int()
    var email : String?
    var firstName : String?
    var lastName : String?
    var imgurl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.idLabelOnSvc.text = String(id)
        self.emailLabelOnSvc.text = email
        self.firstNameOnSvc.text = firstName
        self.lastNameOnSvc.text = lastName
     
        let fetchImage = NSURL(string: imgurl!)
        imgOnSvc.sd_setImage(with: fetchImage as URL?)
    }
    
    
}
