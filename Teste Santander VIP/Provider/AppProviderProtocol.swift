//
//  AppProviderProtocol.swift
//  Teste Santander VIP
//
//  Created by Virtual Machine on 14/09/21.
//

import UIKit

protocol AppProviderProtocol {
    func list(request: Login.Something.Request, completion: @escaping APIResultParse)
}
