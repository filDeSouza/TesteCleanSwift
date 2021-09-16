//
//  AppProviderProtocol.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol LoginProviderProtocol {
    func login(request: Login.Acao.Request, completion: @escaping (LoginModel?) -> Void)
}

protocol ExtratoProviderProtocol {
    func obterExtrato(request: Home.Acao.Request, completion: @escaping ([ExtratoModel]?) -> Void)
}
