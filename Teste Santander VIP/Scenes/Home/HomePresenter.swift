//
//  HomePresenter.swift
//  Teste Santander VIP
//
//  Created by Filipe de Souza on 16/09/21.
//

import UIKit

protocol HomePresentationLogic {
    func presentExtrato(response: Home.Acao.Response)
    func presentUsuario(usuario: LoginModel)
}

class HomePresenter: HomePresentationLogic{

    var viewController: HomeDisplayLogic?
    
    func presentExtrato(response: Home.Acao.Response) {
        let viewModel = Home.Acao.ViewModel(extrato: response.extrato)
        
        // MARK: Retorna para a View o valor do response
        viewController?.displayExtrato(viewModel: viewModel)
    }
    
    func presentUsuario(usuario: LoginModel){
        viewController?.displayUsuario(usuario: Home.ObtemUsuario.ViewModel(usuario: usuario))
    }
    
}
