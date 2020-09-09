//
//  SocialFeedPresenter.swift
//  SocialFeed
//
//  Created by administrator on 07/09/2020.
//  Copyright © 2020 kishan. All rights reserved.
//

import Foundation

protocol SocialFeedPresenterProtocol {
    func getData()
    func apiResponse(feedData: SocialFeedModel?)
}

class SocialFeedPresenter: SocialFeedPresenterProtocol {
    
    var view: SocialFeedView?
    var interactor: SocialFeedInteractorProtocol?
    
    init(view: SocialFeedView) {
        self.view = view
        self.interactor = SocialFeedInteractor(presenter: self)
    }
    
    func getData() {
        self.interactor?.getData()
    }
    
    func apiResponse(feedData: SocialFeedModel?) {
        self.view?.setApiResponseData(feedData: feedData)
    }
}
