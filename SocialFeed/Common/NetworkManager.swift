//
//  NetworkManager.swift
//  SocialFeed
//
//  Created by administrator on 07/09/2020.
//  Copyright © 2020 kishan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    //MARK: - Variable
    static let shared = NetworkManager()
    private let reachabilityManager = NetworkReachabilityManager()
    
    
    //MARK: - check connectivity
    static var isConnectedToInternet: Bool  = true
    
    
  
    //MARK: - Get Data
    static func get(url:String, headers:HTTPHeaders, parameters: Parameters = [:] ,response: @escaping(DataResponse<Any>?, Error?, Int?) -> Void) {
        if NetworkManager.isConnectedToInternet {
            Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: URLEncoding.Destination.queryString, arrayEncoding: URLEncoding.ArrayEncoding.brackets, boolEncoding: URLEncoding.BoolEncoding.numeric), headers: headers).responseJSON { (data) in
                print(data.request as Any)
                print(data.result.value as Any)
                response(data, data.error, data.response?.statusCode)
                
            }
        }else {
            print("No internet")
        }
    }
 
   
}
