//
//  AppBusiness.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class AppBusiness{
    
    let provider = AppProvider()
    
    func login(request: Login.Acao.Request, completion: @escaping (LoginModel?) -> Void, onError: @escaping (ApiError) -> Void){
        provider.login (request: request, completion: {(result) in
            if result != nil{
                do{
                    let login = result
                    completion(login)
                }
            }else{
                return
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
    
    func obtemExtrato(token: String, completion: @escaping ([ExtratoModel]?) -> Void){
        
        provider.obterExtrato(token: token, completion: { (result) in
            
            if result != nil{
                do{
                    let extrato = result
                    completion(extrato)
                }catch{
                    
                }
            }else{
                return
            }
            
        })
        
    }
    
}
