//
//  LoginPresenter.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginPresentationLogic{
    func presentLogin(response: Login.Acao.Response)
    func presentErroLogin(erro: LoginError)
}

class LoginPresenter: LoginPresentationLogic{

    
    
    weak var viewController: LoginDisplayLogic?
    
    func presentLogin(response: Login.Acao.Response) {
        let viewModel = Login.Acao.ViewModel(login: response.login)
        
        // MARK: Retorna para a View o valor do response
        viewController?.displayRouterHome(viewModel: viewModel)
        
    }
    
    
    func presentErroLogin(erro: LoginError) {
        switch erro{
        case .dadosVazios:
            viewController?.displayDadosVazios()
        case .invalidJSON:
            viewController?.displayLoginErrorAlert()
        case .noData:
            viewController?.displayLoginErrorAlert()
        case .noResponse:
            viewController?.displayLoginErrorAlert()
        case .loginInvalido:
            viewController?.displayLoginSenhaInvalidos()
        case .senhaInvalida:
            viewController?.displayLoginSenhaInvalidos()
        case .erroResposta:
            viewController?.displayLoginSenhaInvalidos()
        default:
            viewController?.displayLoginErrorAlert()
        }
    }
    
}
