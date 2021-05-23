//
//  Requestable.swift
//  NetworkingLayer
//
//  Created by Morteza on 5/22/2021.
//

import Foundation

protocol Requestable {
    
    associatedtype ResponseType: Codable
    
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
}

extension Requestable {
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any] {
        return ["": ""]
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
