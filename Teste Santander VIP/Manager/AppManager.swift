//
//  AppManager.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class AppManager{
    let appBusiness = AppBusiness()
    
    func login(request: Login.Acao.Request, completion: @escaping (LoginModel?) -> Void){
        appBusiness.login(request: request, completion: {(result) in
            if result != nil{
                completion(result)
            }else{
                
            }
        })
    }
    
    func obtemExtrato(token: String, completion: @escaping ([ExtratoModel]?) -> Void){
        appBusiness.obtemExtrato(token: token, completion: {(result) in
            
            if result != nil{
                completion(result)
            }else{
                return
            }
            
        })
    }
    
    func obtemUsuario(request: Login.Acao.ViewModel){
        
    }
}
