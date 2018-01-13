//
//  ViewController.swift
//  myDemo
//
//  Created by Vishwanath Deshmukh on 1/12/18.
//  Copyright © 2018 Vishwanath Deshmukh. All rights reserved.
//

import UIKit

class ViewController: : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrEmployees:[Employee] = [Employee]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployees.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:EmployeeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeTableViewCell
        
        let employee = arrEmployees[indexPath.row] ;
        
        cell.userName.text = employee.name
        cell.userId.text = employee.userId
        cell.jobTitle.text = employee.jobTitle
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: arrEmployees[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let employeeDetailViewController = segue.destination as! EmployeeDetailViewController
        employeeDetailViewController.employee = sender as? Employee
    }
    
    func loadEmployeesFromService() {
        
        //EmployeeService.sharedEmployeeService.getName();
        
        EmployeeService.sharedEmployeeService.getEmployees(from: Constants.employeeURL) { (resEmployees : [Employee]) in   // Object received from closure
            self.arrEmployees = resEmployees
            DispatchQueue.main.async {
                //  Updating UI on main queue
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    func loadEmployees() {
        let url = URL.init(fileURLWithPath: "/Users/vishwanathdeshmukh/Desktop/employee.json")
        
        //        guard let url = employeeUrl else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { print(error ?? "Error")  } else {
                do {
                    guard let data = data else { return }
                    
                    let res = try JSONDecoder().decode(Response.self, from: data)
                    let resEmployees:[Employee] = res.employees!
                    
                    
                    
                    self.arrEmployees = resEmployees
                    
                    for emp in self.arrEmployees {
                        guard let name = emp.name else { return };
                        print("User Name: \(name) \n")
                        
                        guard let userId = emp.userId else { return };
                        print("User Name: \(userId) \n")
                        
                    }
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                } catch let jsonError {
                    print("Error:\(jsonError)")
                }
            }
            }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Virtusa Employees"
        loadEmployeesFromService()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

