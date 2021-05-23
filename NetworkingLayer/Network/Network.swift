//
//  Network.swift
//  NetworkingLayer
//
//  Created by Morteza on 5/22/2021.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    func request<T: Requestable>(req: T, _ completion: @escaping (Result<T.ResponseType, Error>) -> Void) {
        
        let request = prepareRequest(req)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let decodedRespose = try? decoder.decode(T.ResponseType.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(decodedRespose!))
                        }
                    }
                } else {
                    let httpError = NSError(domain: "code", code: response.statusCode, userInfo: ["code": response.statusCode])
                    completion(.failure(httpError))
                }
            }
            
        }.resume()
        
    }
}

extension Network {
    private func prepareRequest<T: Requestable>(_ req: T) -> URLRequest {
        
        let url = URL(string: req.path)!
        var request = URLRequest(url: url)
        request.httpMethod = req.method.rawValue
        
        if req.method == .post {
            let jsonData = try? JSONSerialization.data(withJSONObject: req.parameters, options: .prettyPrinted)
            request.httpBody = jsonData
        }
        return request
    }
}
