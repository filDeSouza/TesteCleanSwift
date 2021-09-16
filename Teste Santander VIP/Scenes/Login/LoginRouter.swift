//
//  LoginRouter.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 15/09/21.
//

import UIKit

@objc protocol LoginRoutingLogic{
    func routeToHome(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? {get}
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing{
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?

    // MARK: Routing
    
    func routeToHome(segue: UIStoryboardSegue?)
    {
      if let segue = segue {
        let destinationVC = segue.destination as! HomeViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToHomeDataStore(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "segueHome") as! HomeViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToHomeDataStore(source: dataStore!, destination: &destinationDS)
        navigateToHomeViewController(source: viewController!, destination: destinationVC)
      }
    }

    // MARK: Navigation
    
    func navigateToHomeViewController(source: LoginViewController, destination: HomeViewController)
    {
      source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToHomeDataStore(source: LoginDataStore, destination: inout HomeDataStore)
    {
      //destination.name = source.name
        print("Teste")
    }
    

    
}
