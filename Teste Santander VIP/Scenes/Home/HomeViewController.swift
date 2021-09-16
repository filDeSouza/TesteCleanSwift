//
//  HomeViewController.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 15/09/21.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displayExtrato(viewModel: Home.Acao.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic {

    var dadosUsuario: LoginModel?
    var dadosExtrato: [ExtratoModel] = []
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelDocumento: UILabel!
    @IBOutlet weak var labelSaldo: UILabel!
    @IBOutlet weak var tableViewExtrato: UITableView!
    
    private func setup(){
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dadosUsuarioRecuperados = dadosUsuario else{return}
        print("print na tela de extrato: " + dadosUsuarioRecuperados.nome)
        
    }
    
    func displayExtrato(viewModel: Home.Acao.ViewModel) {
        dadosExtrato = viewModel.extrato
    }
    

    @IBAction func btLogout(_ sender: Any) {
    }
    
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        return dadosExtrato.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExtrato", for: indexPath) as! ExtratoTableViewCell
        let extrato = dadosExtrato[indexPath.row]
        cell.popularCelula(extrato: extrato)
        return cell
        
    }
    
    
    
    
}
