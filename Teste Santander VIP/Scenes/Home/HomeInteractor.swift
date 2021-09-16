//
//  HomeInteractor.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit

protocol HomeBusinessLogic{
    func homeRealizaRequest(request: Home.Acao.Request)
    var extratoModel: ExtratoModel?{get set}
}

protocol HomeDataStore {
    var extratoModel: ExtratoModel?{get set}
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {

    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    var extratoModel: ExtratoModel?
    
    func homeRealizaRequest(request: Home.Acao.Request) {
        
        worker?.fetchExtrato(request: request, completion: {(result) in
            
            guard let resultado = result else {return}
            
            let response = Home.Acao.Response(extrato: resultado)
            
            self.presenter?.presentExtrato(response: response)
            
        })
        
    }
    
    
}
