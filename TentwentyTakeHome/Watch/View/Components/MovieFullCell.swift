//
//  MovieFullCell.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class MovieFullCell: UITableViewCell {

    
    static let reuseID = "MovieFullCell"
    
    let containerView = UIView()
    let movieImageView = UIImageView()
    let movieTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layoutContainerView()
        layoutContainerSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie){
        movieTitleLabel.text = movie.title
        movieImageView.backgroundColor = .purple
    }
    
    private func configure(){
        self.backgroundColor = .clear
        self.selectionStyle = .none
        movieImageView.layer.cornerRadius = 10
        
        movieTitleLabel.textColor = .white
        movieTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        movieTitleLabel.adjustsFontForContentSizeCategory = true
        movieTitleLabel.numberOfLines = 3
    }
    
    
    private func layoutContainerSubViews(){
        let views = [movieImageView, movieTitleLabel]
        
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
        
            movieImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            movieImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            movieImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            movieImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 16),
            movieTitleLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -16)
            
            
        
        ])
        
    }
    
    private func layoutContainerView(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
        
        ])
        
    }
    
    

}
