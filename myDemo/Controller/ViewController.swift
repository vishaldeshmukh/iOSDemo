//
//  ViewController.swift
//  myDemo
//
//  Created by Vishwanath Deshmukh on 1/12/18.
//  Copyright © 2018 Vishwanath Deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrEmployees:[Employee] = [Employee]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployees.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.empRowHeight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:EmployeeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeTableViewCell
        
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.init(red: 252/255, green: 104/255, blue:96/255, alpha: 0.8)
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        let employee = arrEmployees[indexPath.row] ;
        
        cell.userName.text = employee.name
        cell.userId.text = employee.userId
        cell.jobTitle.text = employee.jobTitle
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:  Constants.showDetailSegueID , sender: arrEmployees[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        navigationController?.navigationBar.tintColor = UIColor.white
        let employeeDetailViewController = segue.destination as! EmployeeDetailViewController
        employeeDetailViewController.employee = sender as? Employee
        
    }
    
    func loadEmployeesFromService() {

        EmployeeService.sharedEmployeeService.getEmployees(from: Constants.employeeURL) { (resEmployees : [Employee]) in   // Object received from closure
            self.arrEmployees = resEmployees
            DispatchQueue.main.async {
                //  Updating UI on main queue
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.getDashboardNavigationTintColor(UIColor())()
        navigationController?.navigationBar.titleTextAttributes = UIColor.attrBackKey(UIColor())() as? [NSAttributedStringKey : Any]

        self.title = Constants.dashboardTitle
        loadEmployeesFromService()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


