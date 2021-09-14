//
//  LoginPresenter.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginPresentationLogic{
    func presentSomething(response: Login.Something.response)
}

class LoginPresentar: LoginPresentationLogic{
    
    weak var viewController: LoginDisplayLogic?
    
    func presentSomething(response: Login.Something.response) {
        let viewModel = Login.Something.ViewModel(login: response.login)
        viewController?.displaySomething(viewModel: viewModel)
    }
    
}
