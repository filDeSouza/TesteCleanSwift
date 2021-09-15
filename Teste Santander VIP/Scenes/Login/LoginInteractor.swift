//
//  LoginInteractor.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginBusinessLogic {
    func doSomething(request: Login.Something.Request)
    var login: LoginModel?{get set}
}

protocol LoginDataStore {
    var login: LoginModel?{get set}
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore{
        
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var login: LoginModel?
    
    func doSomething(request: Login.Something.Request) {
        worker = LoginWorker()
        worker?.fetchLogin(request: request, completion: {(result) in
            let response = Login.Something.Response(login: result)
            self.presenter?.presentSomething(response: response)
        })
    }
    
}
