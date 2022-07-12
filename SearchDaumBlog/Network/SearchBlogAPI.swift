//
//  SearchBlogAPI.swift
//  SearchDaumBlog
//
//  Created by HwangByungJo  on 2022/07/12.
//

import Foundation


struct SearchBlogAPI {
  static let schme = "https"
  static let host = "dapi.kakao.com"
  static let path = "/v2/search/"
  
  func searchBlog(query: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = SearchBlogAPI.schme
    components.host = SearchBlogAPI.host
    components.path = SearchBlogAPI.path + "blog"
    
    components.queryItems =  [
      URLQueryItem(name: "query", value: query)      
    ]
    return components
  }
}
