//
//  ViewController.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displaySomething(viewModel: Login.Acao.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var loginResult: LoginModel!
    
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
    
    
    func displaySomething(viewModel: Login.Acao.ViewModel) {
        loginResult = viewModel.login
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
                
    }
    
    @IBAction func btLoginAction(_ sender: UIButton) {
        
        guard let usuario = self.tfUsuario.text else {return}
        guard let senha = self.tfSenha.text else {return}
        let requestLogin = Login.Acao.Request(login: usuario, senha: senha)
        print("Log requestLogin: \(requestLogin)")
        interactor?.realizaLogin(request: requestLogin)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let scene = segue.identifier{
            if scene == "segueHome" {
                let homeViewController = segue.destination as! HomeViewController
                homeViewController.dadosUsuario = loginResult
            }
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
        
    }
    
}

