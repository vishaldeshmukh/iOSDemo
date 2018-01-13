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

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
