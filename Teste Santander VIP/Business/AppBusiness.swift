//
//  AppBusiness.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class AppBusiness{
    
    let provider = AppProvider()
    
    func list(request: Login.Something.Request, completion: @escaping APIResultParse){
        provider.list (request: request, completion: {(result) in
            if result != nil{
                do{
                    let login = result
                    completion(login)
                }catch{
                    
                }
            }else{
                
            }
        })
    }
    
}
