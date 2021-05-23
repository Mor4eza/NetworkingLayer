//
//  ViewController.swift
//  NetworkingLayer
//
//  Created by Morteza on 5/22/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var employees = [EmployeeData]() {
        didSet {
            tableView.reloadData()
        }
    }
    var tableView: UITableView = {
        let tb = UITableView()
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        Network.shared.request(req: EmployeeRequest()) { result in
            switch result {
                case .success(let employee):
                    print(employee.message)
                    self.employees = employee.data!
                case .failure(let error):
                    print(error)
                
            }
        }
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = employees[indexPath.row].employeeName
        return cell
    }
    
    
}
