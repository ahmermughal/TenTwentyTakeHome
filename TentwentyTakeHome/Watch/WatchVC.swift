//
//  HomeVC.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class WatchVC: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureUI()
        layoutUI()
    }


}

extension WatchVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieFullCell.reuseID, for: indexPath) as! MovieFullCell
        
        cell.movieImageView.backgroundColor = .red
        cell.movieTitleLabel.text = "Harry Potter and the Chamber of Secrets"
        return cell
    }
    
    
}

extension WatchVC{
    
    private func configureVC(){
        view.backgroundColor = MovieColors.secondaryBackgroundColor
    }
    
    private func configureUI(){
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(MovieFullCell.self, forCellReuseIdentifier: MovieFullCell.reuseID)
        tableView.rowHeight = 230
        tableView.separatorStyle = .none
    }
    
    
    private func layoutUI(){
        
        let views = [tableView]
        
        for item in views{
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            
        ])
        
        
    }
    
    
}

