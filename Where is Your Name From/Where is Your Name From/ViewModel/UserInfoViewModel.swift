//
//  UserInfoViewModel.swift
//  Where is Your Name From
//
//  Created by Pedro Boga on 29/10/21.
//

import Foundation

protocol UserInfoViewModelDelegate {
    func mostrarLayoutErro()
}

class UserInfoViewModel {
    private let service = Service()
    
    var delegate: UserInfoViewModelDelegate?
    
    func getUserInfo(with name: String?) {
        //validarNome(com: nome)
        guard let name = name else { return }
        service.getNameInfo(with: name) { nameResponse in
            print(nameResponse.name)
        }
    }
    
    private func validarNome(com nome: String?) -> Bool {
        
        guard let nome = nome,
              Int(nome) == nil,
              nome != "" else {
                  //delegate?.mostrarLayoutErro()
                  return false
              }
        return true
    }
    
    
}
