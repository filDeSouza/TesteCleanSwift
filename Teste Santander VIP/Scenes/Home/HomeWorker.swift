//
//  HomeWorker.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit

class HomeWorker{
    
    let appManager = AppManager()
    
    func fetchExtrato(token: String, completion: @escaping([ExtratoModel]?) -> Void){
        appManager.obtemExtrato(token: token, completion: {(result) in
            
            if result != nil{
                completion(result)
            }else{
                return
            }
            
        })
    }
    
}
