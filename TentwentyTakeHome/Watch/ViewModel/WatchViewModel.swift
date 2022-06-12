//
//  WatchViewModel.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import Foundation
import RxSwift
import RxCocoa
class WatchViewModel{
    
    
    
    // MARK: Variables and Observables
    let dBag = DisposeBag()

    private let _currentState = BehaviorRelay<AppState>(value: .notLoading)
    var currentState: Driver<AppState> {
        _currentState.asDriver()
    }
    
    
    private let _movies = PublishRelay<[Movie]>()
    var movies : Driver<[Movie]>{
        return _movies.asDriver(onErrorJustReturn: [])
    }
    
    // MARK: Init
    init(){
        getUpcomingMovie()
    }
    
    // MARK: Functions
    func getUpcomingMovie(){
        NetworkManager.shared.getUpcomingMovies(page: 1)
            .do(onNext: { [weak self]  _ in
                self?._currentState.accept(.notLoading)
            },
            onError: { [weak self] _ in
                self?._currentState.accept(.notLoading)
            },
            onSubscribe:{ [weak self] in
                self?._currentState.accept(.loading)
            })
            .observe(on: MainScheduler.instance)
            .subscribe(onNext:{ [weak self] response in
                self?._movies.accept(response.movies)
            }, onError: { (error) in
                print("An error: \(error)")
            })
            .disposed(by: dBag)
    }
    
}
