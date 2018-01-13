//
//  Response.swift
//  Demo
//
//  Created by Vishwanath Deshmukh on 1/12/18.
//  Copyright © 2017 Vishwanath Deshmukh. All rights reserved.
//

import Foundation

class Response : Decodable {
    var staus:String?
    var employees: [Employee]?
}
