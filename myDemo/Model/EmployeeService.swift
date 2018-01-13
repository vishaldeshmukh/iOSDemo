//
//  EmployeeService.swift
//  Demo
//
//  Created by Vishwanath Deshmukh on 1/12/18.
//  Copyright © 2017 Vishwanath Deshmukh. All rights reserved.
//

import Foundation

class EmployeeService {
    
    static var sharedEmployeeService = EmployeeService()

    func getEmployees(from urlString: String, completion: @escaping ([Employee]) -> ()) {
        
       // let url = URL.init(fileURLWithPath: urlString)
        guard let url = URL(string: urlString)
            else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { print(error ?? "Error")  }
            else {
                do {
                    guard let data = data else { return }
                    
                    let res = try JSONDecoder().decode(Response.self, from: data)
                    let resEmployees:[Employee] = res.employees!
                    
                    
                    for emp in resEmployees {
                        guard let name = emp.name else { return };
                        print("*User Name: \(name) \n")
                        
                        guard let userId = emp.userId else { return };
                        print("*User Name: \(userId) \n")
                        
                    }
                    
                    completion(resEmployees)
                
                } catch let jsonError {
                    print("Error:\(jsonError)")
                }
            }
            }.resume()
        
    }


}
