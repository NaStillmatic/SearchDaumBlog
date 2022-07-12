//
//  DKBlog.swift
//  SearchDaumBlog
//
//  Created by HwangByungJo  on 2022/07/12.
//

import Foundation


struct DKBlog: Decodable {
  let documents: [DKDocument]
}

struct DKDocument: Decodable {
  let title: String?
  let name: String?
  let thumbnail: String?
  let datetime: Date?
  
  enum CodingKeys: String, CodingKey {
    case title, thumbnail, datetime
    case name = "blogname"
  }
  
  init(from decoder: Decoder) throws {
    let value = try decoder.container(keyedBy: CodingKeys.self)
    
    self.title = try? value.decode(String?.self, forKey: .title)?
      .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
      .replacingOccurrences(of: "&[^;]+;", with: "", options: .regularExpression, range: nil)
    self.name = try? value.decode(String?.self, forKey: .name)
    self.thumbnail = try? value.decode(String?.self, forKey: .thumbnail)
    self.datetime = Date.parse(value, key: .datetime)
  }
}


extension Date {
  static func parse<K: CodingKey>(_ values: KeyedDecodingContainer<K>, key: K) -> Date? {
    guard let dateString = try? values.decode(String.self, forKey: key),
          let date = from(dateString: dateString) else {
      return nil
    }
    return date
  }
  
  static func from(dateString: String) -> Date? {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
    dateFormater.locale = Locale(identifier: "ko_kr")
    if let date = dateFormater.date(from: dateString) {
      return date
    }
    return nil
  }
}
