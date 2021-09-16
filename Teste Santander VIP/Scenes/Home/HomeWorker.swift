//
//  HomeWorker.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit

class HomeWorker{
    
    let appManager = AppManager()
    
    func fetchExtrato(request: Home.Acao.Request, completion: @escaping([ExtratoModel]?) -> Void){
        appManager.obtemExtrato(request: request, completion: {(result) in
            
            if result != nil{
                completion(result)
            }else{
                return
            }
            
        })
    }
    
}
