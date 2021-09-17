//
//  HomeInteractor.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit

protocol HomeBusinessLogic{
    func homeRealizaRequest(request: Home.Acao.Request)
    func homeObtemUsuario(request: Home.ObtemUsuario.Request)
}

protocol HomeDataStore {
    var login: LoginModel? { get set }
    var extratoModel: [ExtratoModel]?{ get }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
        
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    var login: LoginModel?
    var extratoModel: [ExtratoModel]?
    
    func homeRealizaRequest(request: Home.Acao.Request) {
        
        if let token = login?.token{
            worker = HomeWorker()
            worker?.fetchExtrato(token: token, completion: {(result) in
                
                guard let resultado = result else {return}
                let response = Home.Acao.Response(extrato: resultado)
                
                self.presenter?.presentExtrato(response: response)
                
            })
            
        }
        

        
    }
    
    func homeObtemUsuario(request: Home.ObtemUsuario.Request){
        
        presenter?.presentUsuario(usuario: login!)
        
    }
    
}
