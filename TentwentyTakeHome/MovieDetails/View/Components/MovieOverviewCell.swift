//
//  MovieOverviewCell.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class MovieOverviewCell: UITableViewCell {
    static let reuseID = "MovieOverviewCell"
    let overViewLabel = UILabel()
    let descriptionLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        overViewLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        overViewLabel.text = "Overview"
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .secondaryLabel
    }
    
    private func layout(){
        overViewLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(overViewLabel)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            
            overViewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            overViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            descriptionLabel.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: overViewLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        
        ])
    }
    
}
