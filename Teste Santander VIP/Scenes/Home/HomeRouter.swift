//
//  HomeRouter.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import Foundation


@objc protocol HomeRoutingLogic{
    
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? {get}
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing{
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
}
