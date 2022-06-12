//
//  GenreCollectionViewCell.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
 
    static var reuseID: String = "ProductCell"
    
    let pillView = UIView()
    let genreLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        pillView.layer.cornerRadius = 30/2
        genreLabel.font = UIFont.systemFont(ofSize: 12)
        genreLabel.textAlignment = .center
        genreLabel.textColor = .white
        genreLabel.text = "Horror"
    }
    
    func layout(){
        
        pillView.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(pillView)
        pillView.addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
        
            pillView.topAnchor.constraint(equalTo: self.topAnchor),
            pillView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pillView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pillView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            genreLabel.topAnchor.constraint(equalTo: pillView.topAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: pillView.leadingAnchor, constant: 4),
            genreLabel.trailingAnchor.constraint(equalTo: pillView.trailingAnchor, constant: -4),
            genreLabel.bottomAnchor.constraint(equalTo: pillView.bottomAnchor),
        
        ])
        
        
    }
    
    
}
