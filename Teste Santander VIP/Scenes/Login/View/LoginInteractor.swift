//
//  LoginInteractor.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginLogic {
    func doSomething(request: Login.Something.Request)
    var login: LoginModel?{get set}
}

protocol LoginDataStore {
    var login: LoginModel?{get set}
}

class LoginInteractor: LoginLogic, LoginDataStore{
    
    
    var login: LoginModel?
    
    func doSomething(request: Login.Something.Request) {
        <#code#>
    }
    
}
