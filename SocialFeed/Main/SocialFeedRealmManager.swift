//
//  SocialFeedRealmManager.swift
//  SocialFeed
//
//  Created by administrator on 07/09/2020.
//  Copyright © 2020 kishan. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift
protocol SocialFeedRealmManagerProtocol {
    func insertData(model:SocialFeedModel?)
       func getData() ->  Results<SocialFeedModel>?
       func deleteData(model:SocialFeedModel?)
       func removeAllData()
}

class SocialFeedRealmManager: SocialFeedRealmManagerProtocol {
    
    private let realm = (UIApplication.shared.delegate as? AppDelegate)?.realm

    func insertData(model: SocialFeedModel?) {
      
        if let model = model {
            do {
                try realm?.write {
                    realm?.add(model)
                }
            }
            catch let error as NSError {
                fatalError("Boom: \(error)")
            }
        }
    }

    
    func getData() ->  Results<SocialFeedModel>?{
        var data = SocialFeedModel()
        var rawData = realm?.objects(SocialFeedModel.self)
        return rawData
    }
    
    
    func deleteData(model: SocialFeedModel?) {
        
        if let model = model {
            try! realm?.write {
                realm?.delete(model)
            }
        }
    }
    
    
    func removeAllData() {
        if let rawData = realm?.objects(SocialFeedModel.self){
            try! realm?.write {
                realm?.delete(rawData)
            }
        }
    }
    

}




