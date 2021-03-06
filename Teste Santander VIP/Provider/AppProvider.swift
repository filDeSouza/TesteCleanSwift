//
//  AppProvider.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class AppProvider: LoginProviderProtocol{
    
    let requestAPI = APIRequest()
    
    func login(request: Login.Acao.Request, completion: @escaping (LoginModel?) -> Void, onError: @escaping (ApiError) -> Void) {
        let url = APIConstants.base_url
        
        APIRequest.login(url: url, login: request.login, senha: request.senha, completion: {(result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }, onError: {(error) in
            switch error{
            case .invalidJSON:
                onError(.invalidJSON)
            case .noData:
                onError(.noData)
            case .noResponse:
                onError(.noResponse)
            case .erroResposta:
                onError(.erroResposta)
            default:
                print("Erro genérico")
            }
        })
    }
    
}
extension AppProvider: ExtratoProviderProtocol{
        
    func obterExtrato(token: String, completion: @escaping ([ExtratoModel]?) -> Void){
        
        let url = APIConstants.base_url
        APIRequest.obtemExtrato(url: url, token: token, completion: {
            (result) in
            
            if result != nil{
                completion(result)
            }
            
        }, onError: {(error) in
            switch error{
            case .invalidJSON:
                print("JSON inválido")
            case .noData:
                print("Sem dados")
            case .noResponse:
                print("Sem resposta da API")
            case .erroResposta:
                print("Sem resposta da API")
            default:
                print("Erro genérico")
            }
        })
        
    }
    
}
