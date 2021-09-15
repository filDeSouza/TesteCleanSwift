//
//  AppProvider.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class AppProvider: AppProviderProtocol{
    
    let requestAPI = APIRequest()
    
    func list(request: Login.Something.Request, completion: @escaping APIResultParse) {
        
        let url = APIConstants.base_url
        APIRequest.login(url: url, login: request.login, senha: request.senha, completion: {(result) in
            if result != nil{
                completion(result)
            }else{
                
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
