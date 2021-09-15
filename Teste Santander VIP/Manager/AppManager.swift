//
//  AppManager.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class AppManager{
    let appBusiness = AppBusiness()
    
    func list(request: Login.Something.Request, completion: @escaping APIResultParse){
        appBusiness.list(request: request, completion: {(result) in
            if result != nil{
                completion(result)
            }else{
                
            }
        })
    }
}
