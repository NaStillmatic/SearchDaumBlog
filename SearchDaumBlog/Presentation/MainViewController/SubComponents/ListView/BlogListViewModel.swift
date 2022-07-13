//
//  BlogListViewModel.swift
//  SearchDaumBlog
//
//  Created by HwangByungJo  on 2022/07/13.
//


import RxCocoa
import RxSwift


struct BlogListViewModel {

  let filterviewModel = FilterViewModel()
  
  let blogCellData = PublishSubject<[BlogListCellData]>()
  
  let cellData: Driver<[BlogListCellData]>
  
  init() {
    self.cellData = blogCellData
      .asDriver(onErrorJustReturn: [])
  }
  
  
}
