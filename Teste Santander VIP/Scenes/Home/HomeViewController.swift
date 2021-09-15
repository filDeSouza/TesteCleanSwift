//
//  HomeViewController.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 15/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    var dadosUsuario: LoginModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("print na tela de extrato: " + dadosUsuario.nome)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
