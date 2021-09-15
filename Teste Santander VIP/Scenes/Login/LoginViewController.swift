//
//  ViewController.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    private func setup(){
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    func displaySomething(viewModel: Login.Something.ViewModel) {

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
                
    }
    
    @IBAction func btLoginAction(_ sender: UIButton) {
        
        guard let usuario = self.tfUsuario.text else {return}
        guard let senha = self.tfSenha.text else {return}
        let requestLogin = Login.Something.Request(login: usuario, senha: senha)
        print("Log requestLogin: \(requestLogin)")
        interactor?.doSomething(request: requestLogin)
        
    }
    
    
}
