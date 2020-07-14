//
//  HomeCollectionViewCell.swift
//  NccCineplex
//
//  Created by User on 7/7/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .red
        
        return container
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
   
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupLayout(){
        self.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        containerView.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
}



