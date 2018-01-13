//
//  EmployeeDetailViewController.swift
//  Demo
//
//  Created by Vishwanath Deshmukh on 1/12/18.
//  Copyright © 2017 Vishwanath Deshmukh. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var name: UILabel!
    var employee : Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = employee?.name

        name.text = employee?.name
        userId.text = employee?.userId
        jobTitle.text = employee?.jobTitle

        UINavigationBar.appearance().tintColor = UIColor.white //Desired color here

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
