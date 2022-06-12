//
//  MovieDetailsHeader.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class MovieDetailsHeader: UIView {

    private let imageView = UIImageView()
    private var containerView = UIView()
    
    private var containerViewHeight = NSLayoutConstraint()
    private var imageViewHeightConstraint = NSLayoutConstraint()
    private var imageViewBottomConstraint = NSLayoutConstraint()

    private let getTicketsButton = MovieButton(title: StringConstants.getTicketButtonText, color: MovieColors.accentColor, outlined: false)

    private let watchTrailerButton = MovieButton(title: StringConstants.watchTrailerButtonText, color: MovieColors.accentColor, outlined: true, image: MovieImages.playIcon)
    
    private let movieLabel = UILabel()
    
    required init(frame: CGRect, image: UIImage, text: String) {
        super.init(frame: frame)
        configure()
        layout()
        imageView.image = image
        movieLabel.text = text
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func scrollViewDidScroll(scrollView : UIScrollView){
        containerViewHeight.constant = scrollView.contentInset.top
        let offSetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offSetY <= 0
        imageViewBottomConstraint.constant = offSetY >= 0 ? 0 : -offSetY / 2
        imageViewHeightConstraint.constant = max(offSetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
    
}

extension MovieDetailsHeader{
    
    private func configure(){
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        movieLabel.textAlignment = .center
        movieLabel.textColor = .white
        movieLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    }
    
    private func layout(){
     
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        containerView.addSubview(imageView)
        
        getTicketsButton.translatesAutoresizingMaskIntoConstraints = false
        watchTrailerButton.translatesAutoresizingMaskIntoConstraints = false
        movieLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(getTicketsButton)
        containerView.addSubview(watchTrailerButton)
        containerView.addSubview(movieLabel)
        
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        imageViewBottomConstraint = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            self.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            containerViewHeight,
            
            imageView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            imageViewBottomConstraint,
            imageViewHeightConstraint,
            
            watchTrailerButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            watchTrailerButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            watchTrailerButton.heightAnchor.constraint(equalToConstant: 60),
            watchTrailerButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7),

            getTicketsButton.bottomAnchor.constraint(equalTo: watchTrailerButton.topAnchor, constant: -8),
            getTicketsButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            getTicketsButton.heightAnchor.constraint(equalToConstant: 60),
            getTicketsButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7),
            
            movieLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            movieLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8) ,
            movieLabel.bottomAnchor.constraint(equalTo: getTicketsButton.topAnchor, constant: -8)
            
            
        ])
    }
}
