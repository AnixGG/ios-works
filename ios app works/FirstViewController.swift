//
//  FirstViewController.swift
//  ios app works
//
//  Created by Нияз Газизуллин on 20.09.2024.
//

import UIKit

// Реализовано при помощи структуры + protocol (для name, surname & food)
// А также при помощи closure (profession)

class FirstViewController: UIViewController {
    
    private var p = Person()
    private var myprof = ""
    
    
    private var labelname: UILabel = {
        let labelname = UILabel()
        labelname.font = .systemFont(ofSize: 22, weight: .regular)
        labelname.numberOfLines = 0
        labelname.translatesAutoresizingMaskIntoConstraints = false
        return labelname
    }()
    
    private var labelsurname: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var labelfood: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var labelprof: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("CHANGE", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.addAction(
            .init { [weak self] _ in
                self?.showNext()
            }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
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
        
        view.addSubview(labelname)
        NSLayoutConstraint.activate([
            labelname.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            labelname.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(labelsurname)
        NSLayoutConstraint.activate([
            labelsurname.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            labelsurname.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(labelfood)
        NSLayoutConstraint.activate([
            labelfood.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            labelfood.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(labelprof)
        NSLayoutConstraint.activate([
            labelprof.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            labelprof.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func showNext(){
        let controller = SecondViewController()
        controller.delegate = self
        controller.closureDescription = {i in
            self.myprof = i
            self.updateLabels()
        }
        
        navigationController?
            .pushViewController(
                controller,
                animated: true
            )
    }
    
    private func updateLabels(){
        labelname.text = "Name: \(p.name)"
        labelsurname.text = "SurName: \(p.surname)"
        labelfood.text = "Favourite food: \(p.favouritefood)"
        labelprof.text = "Profession: \(myprof)"
    }
}

extension FirstViewController: SecondViewControllerDelegate{
    func setInfo(p p2: Person) {
        p = p2
        updateLabels()
    }
    
    
}


