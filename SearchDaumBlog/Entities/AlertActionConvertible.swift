//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by HwangByungJo  on 2022/07/12.
//

import UIKit

protocol AlertActionConvertible {
  var title: String { get }
  var style: UIAlertAction.Style { get }
}
