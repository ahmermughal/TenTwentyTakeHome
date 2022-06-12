//
//  SearchVC.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class SearchVC: UIViewController {
    

    let headerView = UIView()
    let searchBarView = SearchBarView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureUI()
        configureTableView()
        layoutUI()
        layoutTableView()
    }

    

}

extension SearchVC : UITableViewDataSource{
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

extension SearchVC{
    
    private func configureVC(){
        view.backgroundColor = MovieColors.secondaryBackgroundColor
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureUI(){
        headerView.backgroundColor = .systemBackground
    }
    
    private func configureTableView(){
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(MovieFullCell.self, forCellReuseIdentifier: MovieFullCell.reuseID)
        tableView.rowHeight = 230
        tableView.separatorStyle = .none
    }
    
    private func layoutUI(){
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
    
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(searchBarView)
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),

            searchBarView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            searchBarView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            searchBarView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            searchBarView.heightAnchor.constraint(equalToConstant: 55),
            
            
        ])
        
        
    }

    
    private func layoutTableView(){
        
        let views = [tableView]
        
        for item in views{
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            
        ])
        
        
    }
    
}


