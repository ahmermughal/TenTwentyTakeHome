//
//  BindableType.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import UIKit

protocol BindableType : AnyObject {
  associatedtype ViewModelType
  
  var viewModel : ViewModelType! {get set}
  func bindViewModel()
}

extension BindableType where Self : UIViewController {
  
  func bindViewModel(to model : Self.ViewModelType){
    viewModel = model
    loadViewIfNeeded()
    bindViewModel()
  }
  
}
