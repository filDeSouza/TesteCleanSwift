//
//  LoginWorker.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

class LoginWorker{
    let appManager = AppManager()
    func doSomeWork(){
        
    }
    
    func fetchLogin(request: Login.Something.Request, completion: @escaping(LoginModel) -> Void){
        appManager.list(request: request, completion: {(result) in
            if result != nil {
                completion(result)
            }else{
                
            }
        })
    }
}
