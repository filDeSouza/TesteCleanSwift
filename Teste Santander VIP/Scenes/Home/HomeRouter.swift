//
//  HomeRouter.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit


@objc protocol HomeRoutingLogic{
    func routeToLogin(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing{
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: - Routing
    
    func routeToLogin(segue: UIStoryboardSegue?)
    {
      if let segue = segue {
        let destinationVC = segue.destination as! LoginViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! LoginViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToLoginViewController(source: viewController!, destination: destinationVC)
      }
    }

    // MARK: - Navigation
    
    func navigateToLoginViewController(source: HomeViewController, destination: LoginViewController)
    {
      source.show(destination, sender: nil)
    }
    
     // MARK: - Passing data
    
    func passDataToSomewhere(source: HomeDataStore, destination: inout LoginDataStore)
    {
      //destination.name = source.name
    }
    
    func realizaLogout(){
        
        
        
    }
    
}
