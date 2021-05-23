//
//  EmployeeRequest.swift
//  NetworkingLayer
//
//  Created by Morteza on 5/22/2021.
//

import Foundation

class EmployeeRequest: Requestable {
    typealias ResponseType = EmployeeResponse
    
    var path: String {
        return "https://dummy.restapiexample.com/api/v1/employees"
    }

}
