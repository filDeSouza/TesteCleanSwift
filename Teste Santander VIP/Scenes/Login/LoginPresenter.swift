//
//  LoginPresenter.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginPresentationLogic{
    func presentSomething(response: Login.Something.Response)
}

class LoginPresenter: LoginPresentationLogic{
    
    weak var viewController: LoginDisplayLogic?
    
    func presentSomething(response: Login.Something.Response) {
        let viewModel = Login.Something.ViewModel(login: response.login)
        viewController?.displaySomething(viewModel: viewModel)
    }
    
}
