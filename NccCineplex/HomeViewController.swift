//
//  HomeViewController.swift
//  NccCineplex
//
//  Created by User on 6/30/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewArea: UIView = {
        let viewAr = UIView()
        
        return viewAr
    }()
    
    let viewNCC: UIView = {
        let viewNc = UIView()
        
        return viewNc
    }()
    
    let imageNcc: UIImageView = {
        let image = UIImageView()
        
        image.image  = UIImage(named: "rap1")
        
        
        return image
    }()
    
    let buttonLogin: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    let imageButton: UIImageView = {
        let imageBt = UIImageView()
        
        imageBt.image = UIImage(named: "account")
        
        return imageBt
    }()
    
    let labelButton: UILabel = {
        let labelBt = UILabel()
        labelBt.text = "Đăng nhập"
        labelBt.font = UIFont.systemFont(ofSize: 15)
        labelBt.textColor = .red
        return labelBt
    }()
    
    let scrollView: UIScrollView = {
        let scView = UIScrollView()
        
        return scView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray

        setupLayout()
    }
    
    func setupLayout(){
        
        view.addSubview(viewArea)
        viewArea.translatesAutoresizingMaskIntoConstraints = false
        
        viewArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        viewArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewArea.backgroundColor = .white
        
        view.addSubview(viewNCC)
        viewNCC.translatesAutoresizingMaskIntoConstraints = false
        
        viewNCC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewNCC.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewNCC.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewNCC.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        viewNCC.backgroundColor = .black
        
        view.addSubview(imageNcc)
        imageNcc.translatesAutoresizingMaskIntoConstraints = false
        
        imageNcc.heightAnchor.constraint(equalTo: viewNCC.heightAnchor, multiplier: 0.7).isActive = true
        imageNcc.widthAnchor.constraint(equalTo: viewNCC.widthAnchor, multiplier: 0.2).isActive = true
        imageNcc.leadingAnchor.constraint(equalTo: viewNCC.leadingAnchor, constant: 24).isActive = true
        imageNcc.centerYAnchor.constraint(equalTo: viewNCC.centerYAnchor).isActive = true
        imageNcc.backgroundColor = .black
        
        view.addSubview(buttonLogin)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLogin.heightAnchor.constraint(equalTo: viewNCC.heightAnchor, multiplier: 0.6).isActive = true
        buttonLogin.widthAnchor.constraint(equalTo: viewNCC.widthAnchor, multiplier: 0.3).isActive = true
        buttonLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        buttonLogin.centerYAnchor.constraint(equalTo: viewNCC.centerYAnchor).isActive = true
//        buttonLogin.backgroundColor = .white
        
        view.addSubview(imageButton)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        
        imageButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageButton.leadingAnchor.constraint(equalTo: buttonLogin.leadingAnchor, constant: 8).isActive = true
        imageButton.centerYAnchor.constraint(equalTo: buttonLogin.centerYAnchor).isActive = true
        
        view.addSubview(labelButton)
        labelButton.translatesAutoresizingMaskIntoConstraints = false
        
        labelButton.heightAnchor.constraint(equalTo: buttonLogin.heightAnchor, multiplier: 0.3).isActive = true
        labelButton.widthAnchor.constraint(equalTo: buttonLogin.widthAnchor, multiplier: 0.6).isActive = true
        labelButton.trailingAnchor.constraint(equalTo: buttonLogin.trailingAnchor, constant: -8).isActive = true
        labelButton.centerYAnchor.constraint(equalTo: buttonLogin.centerYAnchor).isActive = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: viewNCC.bottomAnchor, constant: 0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.18).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.backgroundColor = .red
        

        
    }
    

    

}
