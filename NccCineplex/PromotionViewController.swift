//
//  PromotionViewController.swift
//  NccCineplex
//
//  Created by User on 7/6/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit

class PromotionViewController: UIViewController {
    
    let viewArea: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           
           
           return view
       }()
       
       let viewNCC: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           
           view.backgroundColor = .black
           
           return view
       }()
       
       let imageNcc: UIImageView = {
           let imageView = UIImageView()
           imageView.translatesAutoresizingMaskIntoConstraints = false
           
           imageView.backgroundColor = .black
           imageView.image  = UIImage(named: "rap1")
           
           
           return imageView
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAddSubview()
        setupLayout()
    }
    
    func setupAddSubview(){
              view.addSubview(viewArea)
              view.addSubview(viewNCC)
              view.addSubview(imageNcc)
              
          }
       
       func setupLayout(){
           // layout view safe area
           viewArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
           viewArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
           viewArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           viewArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           
           
           // layout view chứa image rạp phim và button đăng nhập
           viewNCC.topAnchor.constraint(equalTo: viewArea.topAnchor).isActive = true
           viewNCC.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           viewNCC.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           viewNCC.heightAnchor.constraint(equalTo: viewArea.heightAnchor, multiplier: 0.1).isActive = true
           
           
           // layout image rạp phim
           imageNcc.heightAnchor.constraint(equalTo: viewNCC.heightAnchor, multiplier: 0.7).isActive = true
           imageNcc.widthAnchor.constraint(equalTo: viewNCC.widthAnchor, multiplier: 0.2).isActive = true
           imageNcc.leadingAnchor.constraint(equalTo: viewNCC.leadingAnchor, constant: 24).isActive = true
           imageNcc.centerYAnchor.constraint(equalTo: viewNCC.centerYAnchor).isActive = true
       }

    

}
