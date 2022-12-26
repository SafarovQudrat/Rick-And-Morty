//
//  MainVC.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import UIKit
import SDWebImage
import Alamofire
import SwiftyJSON
class MainVC: UIViewController {

    @IBOutlet weak var collecView: UICollectionView!
    var arr:[DataDM] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1540856957, green: 0.1691044867, blue: 0.1987410784, alpha: 1)
        getData()
    }
    func setUpCollectionView() {
        collecView.delegate = self
        collecView.dataSource = self
        collecView.register(UINib(nibName: "MainCVC", bundle: nil), forCellWithReuseIdentifier: "MainCVC")
        
    }

   
}
//MARK: - UICollectionViewDelegate
extension MainVC:UICollectionViewDelegate {
    
}
//MARK: - UICollectionViewDataSource
extension MainVC:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCVC", for: indexPath) as? MainCVC else {return UICollectionViewCell()}
        cell.layer.cornerRadius = 16
        cell.updateCell(data: arr[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
}
//MARK: - UICollectionViewDelegateFlowLayout
extension MainVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.view.frame.width - 32, height: 2*(self.view.frame.height-80)/9)
    }
    
}
extension MainVC {
    func getData(){
        let url = "https://rickandmortyapi.com/api/character"
        
        AF.request(url,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil).responseData { response in
            
            switch response.result {
            case.success(let data):
                let jsonData = JSON(data)
//               print("jsonData=",jsonData)
                let info = jsonData["results"].array
                guard let info = info else {return}
                self.arr = info.map{DataDM(json: $0)}
                self.setUpCollectionView()
            case.failure(let error):
                print("error:",error.localizedDescription)
                
            }
        }
    }
}

