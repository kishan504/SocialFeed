//
//  SocialFeedInteractor.swift
//  SocialFeed
//
//  Created by administrator on 07/09/2020.
//  Copyright © 2020 kishan. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import Realm


protocol SocialFeedInteractorProtocol {
    func getData()
}

class SocialFeedInteractor: SocialFeedInteractorProtocol {
    
    var presenter:SocialFeedPresenter?
    var realmManager = SocialFeedRealmManager()
    
    init(presenter: SocialFeedPresenter) {
        self.presenter = presenter
    }
    
    func getData() {
        NetworkManager.get(url: APIs.url, headers: [:]) { (data, error, statusCode) in
            
            if let statusCode = statusCode {
                switch statusCode {
                case APIs.SUCCESS_200...APIs.SUCCESS_300 :
                    let _data = self.decodeSummary(data: data)
                    self.success(data: _data)
                case APIs.INVALID_CONTENT:
                    let data = self.decodeSummary(data: data)
                default: print("no data")
                }
            }
            
        }
    }
    
   private func success(data: SocialFeedModel?) {
    self.presenter?.apiResponse(feedData: data)
           if let data = data {
            self.saveData(data: data)
               
               
           }
       }
       
       private func decodeSummary(data: DataResponse<Any>?) -> SocialFeedModel? {
           if let data = data, data.data != nil {
               
               let decoder = JSONDecoder()
               do {
                   let decoderJson = try decoder.decode(SocialFeedModel.self, from: data.data!)
                   return decoderJson
               }catch let error {
                   print(error)
                   return nil
               }
           }else {
               return nil
           }
       }
    
    
      private func saveData(data: SocialFeedModel?) {
          DispatchQueue.main.async { [weak self] in
              if self != nil {
              
                self?.realmManager.insertData(model: data)
              }
          }
      }
      
    
}
