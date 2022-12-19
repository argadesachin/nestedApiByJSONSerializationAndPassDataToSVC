//
//  Task1TableViewCell.swift
//  JSONParsingTask1
//
//  Created by Mac on 19/11/22.
//

import UIKit
import SDWebImage
class Task1TableViewCell: UITableViewCell {

    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var task1IdLabel: UILabel!
    @IBOutlet weak var task1EmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
