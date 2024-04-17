//
//  CharactersCoordinator.swift
//  Rick and Morty
//
//  Created by MacBook Pro on 12/12/23.
//

import UIKit
//MARK: CharactersCoordinator

final class CharactersCoordinator: Coordinator {
    var childCoordinators =  [Coordinator]()
    var navigationController: UINavigationController
    
    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let vc = CharactersVC()
        vc.title = "Characters"
        vc.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.2"), tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}

