//
//  HomeModels.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import Foundation

enum Home{
    enum Acao{
        struct Request {
            let token: String
        }
        struct Response {
            let extrato: [ExtratoModel]
        }
        struct ViewModel {
            let extrato: [ExtratoModel]
        }
    }
}

