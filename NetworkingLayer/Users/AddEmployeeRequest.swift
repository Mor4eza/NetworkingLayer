//
//  AddEmployeeRequest.swift
//  NetworkingLayer
//
//  Created by Morteza on 6/21/21.
//

import Foundation

struct AddEmployeeRequest: Requestable {
    typealias ResponseType = EmployeeResponse
    
    var name: String?
    var salary: String?
    var age: String?
    
    var path: String {
        return "http://dummy.restapiexample.com/api/v1/create"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var parameters: [String : Any] {
        let params = ["name": name,
                      "salary": salary,
                      "age": age]
        return params as [String : Any]
    }
    
}
