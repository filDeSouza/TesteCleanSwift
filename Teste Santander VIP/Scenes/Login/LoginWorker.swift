//
//  LoginWorker.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit
import SVProgressHUD
import KeychainSwift

enum LoginError {
    case loginInvalido
    case senhaInvalida
    case dadosVazios
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
    case erroResposta
}

class LoginWorker{
    let appManager = AppManager()
    var usuario: String?
    let keyChain = KeychainSwift()
    func doSomeWork(){
        
    }
    
    func fetchLogin(request: Login.Acao.Request, completion: @escaping(LoginModel?) -> Void, onError: @escaping(LoginError) -> Void){
        
        
        
        let utils = Utils()
        if utils.validarDadosVazios(dadosUsuario: request.login, dadosSenha: request.senha) {
            onError(.dadosVazios)
            return
        } else if !utils.isEmailValido(request.login) && !utils.validarCPF(request.login) {
            onError(.loginInvalido)
            return
        } else if !utils.validacaoSenha(senha: request.senha){
            onError(.senhaInvalida)
        }else{
            appManager.login(request: request, completion: {(result) in
                self.keyChain.set(request.login, forKey: "usuario")
                if result != nil {
                    completion(result)
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
    }
}
