//
//  SocialFeedModel.swift
//  SocialFeed
//
//  Created by administrator on 07/09/2020.
//  Copyright © 2020 kishan. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Alamofire

class SocialFeedModel: Object, Decodable {
    
    var data = List<Feed>()
    
    enum CodingKeys: String, CodingKey{
        case data = "feed"
    }
    
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.decodeIfPresent([Feed].self, forKey: .data)
        if let data = data {
            for item in data {
                self.data.append(item)
            }
            
        }
    }
    
    required init() {
        super.init()
    }
}

class Feed: Object, Decodable {
    var id = RealmOptional<Int>()
    @objc dynamic var name: String?
    @objc dynamic var status: String?
    @objc dynamic var profilePic: String?
    @objc dynamic var timeStamp:String?
    @objc dynamic var url:String?
    @objc dynamic var image:String?

    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case status = "status"
        case profilePic = "profilePic"
        case timeStamp = "timeStamp"
        case url = "url"
        case image = "image"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id.value = try values.decodeIfPresent(Int.self, forKey: .id)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.status = try values.decodeIfPresent(String.self, forKey: .status)
        self.profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        self.timeStamp = try values.decodeIfPresent(String.self, forKey: .timeStamp)
        self.url = try values.decodeIfPresent(String.self, forKey: .url)
        self.image = try values.decodeIfPresent(String.self, forKey: .image)
    }
    
    
    required init() {
        super.init()
    }
}
