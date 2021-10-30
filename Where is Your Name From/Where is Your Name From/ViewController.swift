//
//  ViewController.swift
//  Where is Your Name From
//
//  Created by Pedro Boga on 29/10/21.
//

import UIKit

class ViewController: UIViewController {
    var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.distribution = .fillEqually
        return stack
    }()
    
    var nomeTextField: UITextField = {
        let nome = UITextField()
        nome.adjustsFontSizeToFitWidth = true
        nome.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        nome.textAlignment = .center
        nome.backgroundColor = .white
        nome.layer.cornerRadius = 8
        nome.placeholder = "Name:"
        return nome
    }()
    
    var checkButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 4
        button.layer.cornerRadius = 8
        button.setTitle("Check", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    let viewModel: UserInfoViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        configConstraints()
    }
    
    func configView() {
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(nomeTextField)
        topStackView.addArrangedSubview(checkButton)
    }
    
    func configConstraints() {
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    @objc func buttonAction() {
        viewModel.getUserInfo(with: nomeTextField.text)
    }
}

extension ViewController: UserInfoViewModelDelegate {
    func mostrarLayoutErro() {
        //
        nomeTextField.layer.borderWidth = 1
        nomeTextField.layer.borderColor = UIColor.red.cgColor
    }
}

