//
//  HomeVC.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit
import NSObject_Rx
class WatchVC: UIViewController, BindableType {
        

    var viewModel: WatchViewModel!
    
    let headerView = UIView()
    let headerTitleLabel = UILabel()
    let headerSearchButton = UIButton()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureUI()
        configureTableView()
        layoutUI()
        layoutTableView()
    }

    @objc private func searchButtonTapped(){
        let vc = SearchVC()
        self.present(vc, animated: true)
    }
    
    func bindViewModel() {
        viewModel.movies.asObservable().subscribe(onNext:{ movies in
            print(movies)
        }).disposed(by: rx.disposeBag)
        
        viewModel.currentState.asObservable().subscribe(onNext:{ state in
            print("State: \(state)")
        }).disposed(by: rx.disposeBag)
        
        
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
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureUI(){
        headerView.backgroundColor = .systemBackground
        headerTitleLabel.text = StringConstants.watch
        headerTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        headerTitleLabel.textColor = .label
        headerSearchButton.setImage(MovieImages.searchIcon.withRenderingMode(.alwaysTemplate), for: .normal)
        headerSearchButton.tintColor = .label
        headerSearchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
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
        let views = [headerTitleLabel, headerSearchButton]
        
        for item in views{
            item.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            headerTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            headerTitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            
            headerSearchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            headerSearchButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16)
            
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
