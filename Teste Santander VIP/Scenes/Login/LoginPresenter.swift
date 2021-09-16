//
//  LoginPresenter.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginPresentationLogic{
    func presentSomething(response: Login.Acao.Response)
}

class LoginPresenter: LoginPresentationLogic{
    
    weak var viewController: LoginDisplayLogic?
    
    func presentSomething(response: Login.Acao.Response) {
        let viewModel = Login.Acao.ViewModel(login: response.login)
        
        // MARK: Retorna para a View o valor do response
        viewController?.displaySomething(viewModel: viewModel)
        
    }
    
}
