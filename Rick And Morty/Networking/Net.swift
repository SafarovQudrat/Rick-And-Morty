//
//  Networking.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import Foundation
import SwiftyJSON
import Alamofire
class NET {
    
    /// JSONEncoding.default
    static func simpleRequest(to url: String, method: HTTPMethod, completion: @escaping (JSON?)->Void) {
        if Reachability.isConnectedToNetwork() {
            let request = AF.request(url, method: method, encoding: URLEncoding.default)
            
            request.responseData { response in
               
                switch response.result {
                    
                case .success(let data):
                    
                    let jsonData = JSON(data)
                    completion(jsonData)
                case .failure(_): break
                    
                }
            }
        } else {
        }
    }
}
