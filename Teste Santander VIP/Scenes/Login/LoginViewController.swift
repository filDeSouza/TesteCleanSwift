//
//  ViewController.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit
import SDLoader
import KeychainSwift

protocol LoginDisplayLogic: AnyObject {
    func displayRouterHome(viewModel: Login.Acao.ViewModel)
    func displayLoginErrorAlert()
    func displayDadosVazios()
    func displayLoginSenhaInvalidos()
}

class LoginViewController: UIViewController, LoginDisplayLogic {

    
    // MARK: - Atributos
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var loginResult: LoginModel!
    let sdLoader = SDLoader()
    let keyChain = KeychainSwift()

    
    // MARK: - Outlets
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var labelErro: UILabel!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        labelErro.isHidden = true
        if keyChain.get("usuario") != nil {
            self.tfUsuario.text = keyChain.get("usuario")
        }
    }
    
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
    
    
    // MARK: - Setup
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
    
    // MARK: - Functions
    func displayRouterHome(viewModel: Login.Acao.ViewModel) {
        DispatchQueue.main.async {
            //self.loginResult = viewModel.login
            self.router?.routeToHome(segue: nil)
        }

    }

    func displayDadosVazios() {
        labelErro.isHidden = false
        self.labelErro.text = "Os campos login e senha devem ser preenchidos"
        sdLoader.stopAnimation()
    }
    
    func displayLoginErrorAlert() {
        sdLoader.stopAnimation()
        let alert = UIAlertController(title: "Aviso", message: "Sistema indisponivel no momento", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayLoginSenhaInvalidos() {
        DispatchQueue.main.async {
            self.labelErro.isHidden = false
            self.labelErro.text = "Login ou senha inválidos"
            self.sdLoader.stopAnimation()
        }

    }
        
    // MARK: - Actions
    @IBAction func btLoginAction(_ sender: UIButton) {
        
        sdLoader.startAnimating(atView: self.view)
        guard let usuario = self.tfUsuario.text else {return}
        guard let senha = self.tfSenha.text else {return}
        let requestLogin = Login.Acao.Request(login: usuario, senha: senha)
        print("Log requestLogin: \(requestLogin)")
        interactor?.realizaLogin(request: requestLogin)

    }
    
    @IBAction func sumirTeclado(_ sender: Any) {
        
        self.view.endEditing(true)
        
    }
    
    
}

