//
//  MovieDetailsVC.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit
import RxSwift
import NSObject_Rx
class MovieDetailsVC: LoadingViewController, BindableType {
    
    let backbutton = UIButton()
    
    var viewModel: MovieDetailsViewModel!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureUI()
        layoutUI()
        setupListeners()
    }
    
    func setupListeners(){
        backbutton.rx.tap.subscribe{[weak self] _ in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: rx.disposeBag)
    }
    
    func bindViewModel() {
        viewModel.movie.asObservable().subscribe{ [weak self] item in
            guard let self = self else {return}
            print(item)
            if let element = item.element, let movie = element {
                
                let headerView = MovieDetailsHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width), imageUrl: movie.posterPath, text: movie.title)
                
                self.tableView.tableHeaderView = headerView
                
            }

        }.disposed(by: rx.disposeBag)
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
            cell.descriptionLabel.text = viewModel._movie.value?.overview
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
    }
    
    private func configureUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GenreCell.self, forCellReuseIdentifier: GenreCell.reuseID)
        tableView.register(MovieOverviewCell.self, forCellReuseIdentifier: MovieOverviewCell.reuseID)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 36, weight: .bold, scale: .large)
        
        let largeBoldIcon = UIImage(systemName: "arrow.left.circle.fill", withConfiguration: largeConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        backbutton.setImage(largeBoldIcon, for: .normal)
    }
    
    private func layoutUI(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        backbutton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backbutton)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            backbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backbutton.heightAnchor.constraint(equalToConstant: 36),
            backbutton.widthAnchor.constraint(equalToConstant: 36)
            
        ])
        
    }
    
}
