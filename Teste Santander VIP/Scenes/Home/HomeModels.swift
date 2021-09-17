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
            
        }
        struct Response {
            let extrato: [ExtratoModel]
        }
        struct ViewModel {
            let extrato: [ExtratoModel]
        }
    }
    
    enum ObtemUsuario{
        struct Request{
            
        }
        struct Response{
            var usuario: LoginModel
        }
        struct ViewModel {
            var usuario: LoginModel
        }
    }
}

