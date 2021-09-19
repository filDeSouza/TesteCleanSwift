//
//  APIRequest.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import Foundation
import UIKit

enum ApiError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
    case erroResposta
}

class APIRequest{
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func login(url: String, login: String, senha: String, completion: @escaping (LoginModel?) -> Void, onError: @escaping(ApiError) -> Void){
        
        let urlString = url + "/login"
        
        guard let url = URL(string: urlString)else{
            onError(.url)
            return
        }
        
        let parametros = ["username": login, "password": senha ] as Dictionary<String, String>
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(parametros)
        
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil{
                return
            }
            guard let response = response as? HTTPURLResponse else{
                onError(.noResponse)
                return
            }
            if response.statusCode == 200{
                print(response)
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    
                    var usuario = LoginModel()
                    
                    if json["message"] != nil {
                        print("Erro na utilização dos dados")
                    }else{
                        usuario.nome = (json["nome"] as! String)
                        usuario.cpf = (json["cpf"] as! String)
                        usuario.token = (json["token"] as! String)
                        usuario.saldo = (json["saldo"] as! NSNumber).doubleValue
                    }
                    
                    completion(usuario)
                    
                    
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }else if response.statusCode == 401{
                onError(.erroResposta)
            }
            
        })
        dataTask.resume()
        
    }
    
    class func obtemExtrato(url: String, token: String, completion: @escaping ([ExtratoModel]?) -> Void, onError: @escaping(ApiError) -> Void){
        
        let urlString = url + "/extrato"
        
        guard let url = URL(string: urlString)else{
            onError(.url)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "token")
        
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil{
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                onError(.noResponse)
                return
            }
            
            if response.statusCode == 200 {
                print(response)
                guard let data = data else{return}
                do{
                    
                    let extrato = try JSONDecoder().decode([ExtratoModel].self, from: data)
                    
                    completion(extrato)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            }else if response.statusCode == 401{
                onError(.erroResposta)
            }else{
                print("Erro no REST")
            }
            
        })
        dataTask.resume()
    }
}
