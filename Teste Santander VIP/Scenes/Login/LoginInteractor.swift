//
//  LoginInteractor.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginBusinessLogic {
    func realizaLogin(request: Login.Acao.Request)
    var login: LoginModel?{get set}
}

protocol LoginDataStore {
    var login: LoginModel?{get set}
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore{
        
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var login: LoginModel?
    
    func realizaLogin(request: Login.Acao.Request) {
        //worker = LoginWorker()
        worker?.fetchLogin(request: request, completion: {(result) in
            
            guard let resultado = result else {return}
            
            let response = Login.Acao.Response(login: resultado)
                            
            // MARK: Chama o Presenter
            self.presenter?.presentSomething(response: response)
            

        })
    }
    
}
