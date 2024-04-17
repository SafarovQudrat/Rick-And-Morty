//
//  DataProvider.swift
//  Rick and Morty
//
//  Created by MacBook Pro on 12/12/23.
//

import UIKit

final class DataProvider: NSObject, UITableViewDelegate,UITableViewDataSource {
    
    weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    weak var viewController: UIViewController?
    internal var item = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}


