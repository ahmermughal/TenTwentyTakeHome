//
//  MovieDetailsViewModel.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import Foundation
import RxSwift
import RxCocoa
class MovieDetailsViewModel{
    
    let dBag = DisposeBag()
    
    let _movie = BehaviorRelay<Movie?>(value: nil)
    var movie : Driver<Movie?>{
        return _movie.asDriver(onErrorJustReturn: nil)
    }
    
    init(movie: Movie){
        _movie.accept(movie)
    }
    
}
