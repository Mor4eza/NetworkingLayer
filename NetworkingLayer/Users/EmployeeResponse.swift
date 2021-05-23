//
//  EmployeeResponse.swift
//  NetworkingLayer
//
//  Created by Morteza on 5/22/2021.
//

import Foundation

struct EmployeeResponse: Codable {
    var status: String?
    var data: [EmployeeData]?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case message = "message"
        case status = "status"
    }
}

struct EmployeeData: Codable {
    var id: Int?
    var employeeName: String?
    var employeeSalary: Int?
    var employeeAge: Int?
    var profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case employeeAge = "employee_age"
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case id = "id"
        case profileImage = "profile_image"
    }
}
