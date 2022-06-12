//
//  MovieDetailsVC.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

class MovieDetailsVC: LoadingViewController, BindableType {
    
    var viewModel: MovieDetailsViewModel!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureUI()
        layoutUI()
    }

    func bindViewModel() {
        
    }
}

extension MovieDetailsVC : UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: GenreCell.reuseID, for: indexPath) as! GenreCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieOverviewCell.reuseID, for: indexPath) as! MovieOverviewCell
            cell.descriptionLabel.text = "aasdasjkdhasjdhasjkdhaskjdhasjkdhaskjdhaskjdhasjkhdksjahdksjahdkjsahdaskjdhkasjdhasjkdhajskdhajkdasdasdasd"
            return cell
        }

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? MovieDetailsHeader else{
            return
        }
        header.scrollViewDidScroll(scrollView: scrollView)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else{
            return UITableView.automaticDimension
        }
    }
    
}

extension MovieDetailsVC{
    
    private func configureVC(){
        view.backgroundColor = MovieColors.secondaryBackgroundColor
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureUI(){
        let headerView = MovieDetailsHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width), image: UIImage(named: "image-4")!, text: "Coming out July 21")
        tableView.tableHeaderView = headerView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GenreCell.self, forCellReuseIdentifier: GenreCell.reuseID)
        tableView.register(MovieOverviewCell.self, forCellReuseIdentifier: MovieOverviewCell.reuseID)

    }
    
    private func layoutUI(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            
        ])
        
    }
    
}
