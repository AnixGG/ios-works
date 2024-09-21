//
//  MainViewController.swift
//  first_project
//
//  Created by Нияз Газизуллин on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let images: [String] = ["first", "second", "third"]
    private let name_images: [String] = ["pirate", "woman", "chel"]
    private var idx: Int = 0

    private var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "first")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "pirate"
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button_right: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(
            .init { [weak self] _ in
                self?.buttonActionRight()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var button_left: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(
            .init { [weak self] _ in
                self?.buttonActionLeft()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    private func get_name()->String{
        return name_images[idx]
    }
    
    private func get_image()->String{
        return images[idx]
    }
    
    
    private func buttonActionRight() {
        idx = (idx + 1)%3
        label.text = get_name()
        imageView.image = UIImage(named: get_image())
    }
    
    private func buttonActionLeft() {
        idx -= 1
        if idx < 0 {idx = 2}
        label.text = get_name()
        imageView.image = UIImage(named: get_image())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    private func configureUI(){
        view.backgroundColor = .lightGray
        
        view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.widthAnchor.constraint(equalToConstant: 300),
            customView.heightAnchor.constraint(equalToConstant: 300),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -125),
            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
        ])
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -125)
        ])

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button_right)
        NSLayoutConstraint.activate([
            button_right.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            button_right.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100)
        ])

        view.addSubview(button_left)
        NSLayoutConstraint.activate([
            button_left.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            button_left.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100)
        ])
    }
}




