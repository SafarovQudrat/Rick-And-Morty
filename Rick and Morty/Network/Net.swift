//
//  NetworkRequest.swift
//  Rick and Morty
//
//  Created by MacBook Pro on 13/12/23.
//

import UIKit
import Alamofire
import SwiftyJSON
class NetworkRequest {
    static let shared = NetworkRequest()
   
    private init() {}
    
    func getData(url: String, complation: @escaping (Result<Data,Error>) -> Void) {
        guard let url = URL(string: url)  else {return}
        print("URL = \(url)")
            URLSession.shared.request(url) { mydata, _, error in
                if error != nil {
                    complation(.failure(error!))
                }else {
                    guard let mydata = mydata else {return}
                    
                    complation(.success(mydata))
                }
            }
        
    }
    
    func getImage(url:String,complation: @escaping (Result<Data,Error>)-> Void) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.request(url) { data, _ , error in
            if error != nil {
                complation(.failure(error!))
            }else {
                guard let data = data else {return}
                complation(.success(data))
            }
        }
    }
}

class Net {
    
    static func simpleRequest(to url: String, method: HTTPMethod, withLoader: Bool = true, completion: @escaping ([CharacterDM]?)->Void) {
        
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                if let subData = jsonData["results"].array {
                    completion(subData.map{ CharacterDM(json: $0)})
                }
                
            case .failure(let error):
                print("error", error.localizedDescription)
            }
        }
        
        
        
    }
    
    
    
}
