//
//  EmployeeTableViewCell.swift
//  Demo
//
//  Created by Vishwanath Deshmukh on 1/12/18.
//  Copyright © 2017 Vishwanath Deshmukh. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var userId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
