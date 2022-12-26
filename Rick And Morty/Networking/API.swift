//
//  API.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import Foundation
import Alamofire
import SwiftyJSON
class API {
    
   static let url = "https://rickandmortyapi.com/api/character"
    
    static func getCharacterData( completion: @escaping ([DataDM]?)->Void) {
        
        NET.simpleRequest(to: url, method: .get) { data in
            guard let data = data else { return }
            let myData = data["results"].arrayValue.map{DataDM(json: $0)}
            completion(myData)
            
        }
        
    }
    
    static func getCharacterInfo( url:String, completion: @escaping (DataDM?)->Void) {
        
        NET.simpleRequest(to: url, method: .get) { data in
            guard let data = data else { return }
            let myData = DataDM(json: data)
            completion(myData)
            
        }
        
    }
    
    
    
    
}
