//
//  CharactersVC.swift
//  Rick and Morty
//
//  Created by MacBook Pro on 12/12/23.
//

import UIKit

class CharactersVC: UIViewController {

    
    internal var coordinator: CharactersCoordinator?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apperanceSettings()
    }


 

}
extension CharactersVC {
    func apperanceSettings() {
        self.navigationController?.navigationBar.apperenceNavBar()
    }
}
