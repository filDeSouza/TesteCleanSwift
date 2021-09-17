//
//  HomeViewController.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 15/09/21.
//

import UIKit

protocol HomeDisplayLogic {
    func displayExtrato(viewModel: Home.Acao.ViewModel)
    func displayUsuario(usuario: Home.ObtemUsuario.ViewModel)
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
    
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewExtrato.dataSource = self
        self.tableViewExtrato.delegate = self
        setupUsuario()
        obtemExtrato()
    }
    
    func setupUsuario() {
        interactor?.homeObtemUsuario(request: Home.ObtemUsuario.Request())
    }
    
    func obtemExtrato() {
        interactor?.homeRealizaRequest(request: Home.Acao.Request())
    }
    
    func displayExtrato(viewModel: Home.Acao.ViewModel) {
        DispatchQueue.main.async {
            self.dadosExtrato = viewModel.extrato
            self.tableViewExtrato.reloadData()
        }
    }
    
    
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
    
    func displayUsuario(usuario: Home.ObtemUsuario.ViewModel) {
        DispatchQueue.main.async {
            self.labelNome.text = usuario.usuario.nome
            self.labelDocumento.text = usuario.usuario.cpf
            self.labelSaldo.text = "R$ \(usuario.usuario.saldo)"
        }
    }

    @IBAction func btLogout(_ sender: Any) {
        
        router?.realizaLogout()
        
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
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
