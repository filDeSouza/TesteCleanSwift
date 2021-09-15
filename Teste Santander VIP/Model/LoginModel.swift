//
//  LoginModel.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import Foundation

struct LoginModel: Codable{
    
    var nome: String = ""
    var cpf: String = ""
    var saldo: Double = 0.0
    var token: String = ""
    
}

struct LoginModelRoot: Codable{
    let data: LoginModel
}

struct LoginModelResult: Codable {
    let results: [LoginModel]
}
