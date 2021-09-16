//
//  LoginModels.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

enum Login{
    enum Acao{
        struct Request {
            let login: String
            let senha: String
        }
        struct Response {
            let login: LoginModel
        }
        struct ViewModel {
            let login: LoginModel
        }
    }
}
