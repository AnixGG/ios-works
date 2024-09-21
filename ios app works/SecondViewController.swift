//
//  SecondViewController.swift
//  ios app works
//
//  Created by Нияз Газизуллин on 21.09.2024.
//

import UIKit

protocol SecondViewControllerDelegate {
    func setInfo(p:Person)
}


class SecondViewController: UIViewController, UITextFieldDelegate {
    var t = Person()
    var myprof = ""
    var delegate: SecondViewControllerDelegate?
    var closureDescription: ((String) -> Void)?
    
    private lazy var textfieldname: UITextField = {
        let textfieldname = UITextField()
        textfieldname.delegate = self
        textfieldname.placeholder = "Write name"
        textfieldname.backgroundColor = .white
        textfieldname.translatesAutoresizingMaskIntoConstraints = false
        textfieldname.borderStyle = .line
        return textfieldname
    }()
    
    private lazy var textfieldsurname: UITextField = {
        let textfieldsurname = UITextField()
        textfieldsurname.placeholder = "Write surname"
        textfieldsurname.backgroundColor = .white
        textfieldsurname.translatesAutoresizingMaskIntoConstraints = false
        textfieldsurname.borderStyle = .line
        return textfieldsurname
    }()
    
    private lazy var textfieldfavouritefood: UITextField = {
        let textfieldfavouritefood = UITextField()
        textfieldfavouritefood.placeholder = "Write favourite food"
        textfieldfavouritefood.backgroundColor = .white
        textfieldfavouritefood.translatesAutoresizingMaskIntoConstraints = false
        textfieldfavouritefood.borderStyle = .line
        return textfieldfavouritefood
    }()
    
    private lazy var textfieldprof: UITextField = {
        let textfieldprof = UITextField()
        textfieldprof.placeholder = "Write profession"
        textfieldprof.backgroundColor = .white
        textfieldprof.translatesAutoresizingMaskIntoConstraints = false
        textfieldprof.borderStyle = .line
        return textfieldprof
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.addAction(
            .init { [weak self] _ in
                guard let self else { return }
                getInfo()
                delegate?.setInfo(p:t)
                closureDescription?(myprof)
                navigationController?.popViewController(animated: true)
            }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .white
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo:
                    view.safeAreaLayoutGuide.leadingAnchor, constant:
                    50),
            button.trailingAnchor.constraint(equalTo:
                    view.safeAreaLayoutGuide.trailingAnchor, constant:
                    -50),
            button.bottomAnchor.constraint(equalTo:
                    view.safeAreaLayoutGuide.bottomAnchor, constant:
                    -50),
        ])
        
        view.addSubview(textfieldname)
        NSLayoutConstraint.activate([
            textfieldname.heightAnchor.constraint(equalToConstant: 35),
            textfieldname.widthAnchor.constraint(equalToConstant: 200),
            textfieldname.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfieldname.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
        ])
        
        view.addSubview(textfieldsurname)
        NSLayoutConstraint.activate([
            textfieldsurname.heightAnchor.constraint(equalToConstant: 35),
            textfieldsurname.widthAnchor.constraint(equalToConstant: 200),
            textfieldsurname.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfieldsurname.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
        ])
        
        view.addSubview(textfieldfavouritefood)
        NSLayoutConstraint.activate([
            textfieldfavouritefood.heightAnchor.constraint(equalToConstant: 35),
            textfieldfavouritefood.widthAnchor.constraint(equalToConstant: 200),
            textfieldfavouritefood.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfieldfavouritefood.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
        ])
        
        view.addSubview(textfieldprof)
        NSLayoutConstraint.activate([
            textfieldprof.heightAnchor.constraint(equalToConstant: 35),
            textfieldprof.widthAnchor.constraint(equalToConstant: 200),
            textfieldprof.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfieldprof.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
        ])
        
    }
    
    private func getInfo(){
        guard let name = textfieldname.text else { return }
        guard let surname = textfieldsurname.text else { return }
        guard let food = textfieldfavouritefood.text else { return }
        guard let prof = textfieldprof.text else { return }
        t.name = name
        t.surname = surname
        t.favouritefood = food
        myprof = prof
    }
    
}
