//
//  Coordinator.swift
//  Rick and Morty
//
//  Created by MacBook Pro on 12/12/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}


