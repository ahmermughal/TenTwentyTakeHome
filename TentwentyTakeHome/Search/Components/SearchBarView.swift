//
//  SearchBarView.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

protocol SearchBarViewDelegate {
    func searchTapped()
}

class SearchBarView: UIView {

    private let textField = UITextField()
    private let searchIcon = UIImageView(frame: .zero)
    private let closeButton = UIButton()
    
    var delegate : SearchBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupLayout()
        layoutViews()
    }
    
    private func setupLayout(){
        textField.placeholder = StringConstants.searchBarPlaceholder
        textField.textColor = .label
        searchIcon.image = MovieImages.searchIcon.withTintColor(.label, renderingMode: .alwaysOriginal)
        searchIcon.contentMode = .center
        self.layer.cornerRadius = 55/2
        self.backgroundColor = MovieColors.secondaryBackgroundColor
        closeButton.setImage(MovieImages.closeIcon.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    @objc func searchWasTapped(){
        delegate?.searchTapped()
    }
    
    private func layoutViews(){
        
        let views = [searchIcon, textField, closeButton]
        
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        
        
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            searchIcon.heightAnchor.constraint(equalToConstant: 34),
            searchIcon.widthAnchor.constraint(equalToConstant: 34),
            
            closeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            closeButton.heightAnchor.constraint(equalToConstant: 34),
            closeButton.widthAnchor.constraint(equalToConstant: 34),
            
 
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -8),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
