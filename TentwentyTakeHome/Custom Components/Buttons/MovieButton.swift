//
//  MovieButton.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class MovieButton: UIButton {

    let iconImageView = UIImageView()
    
    init(title: String, color: UIColor, outlined: Bool, image: UIImage? = nil) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        backgroundColor = outlined ? .clear : color
        self.layer.cornerRadius = 10
        if outlined{
            self.layer.borderWidth = 2
            self.layer.borderColor = color.cgColor
        }
        titleLabel?.textColor = .white
        iconImageView.image = image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        layoutImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutImageView(){
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
        
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: titleLabel!.leadingAnchor, constant: -8),
            iconImageView.heightAnchor.constraint(equalTo: titleLabel!.heightAnchor, multiplier: 0.8),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
        ])
        
    }
    
}
