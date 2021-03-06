//
//  BlogListCell.swift
//  SearchDaumBlog
//
//  Created by HwangByungJo  on 2022/07/12.
//

import UIKit
import SnapKit
import Kingfisher

class BlogListCell: UITableViewCell {
  
  let thumbnailImageView = UIImageView()
  let namelabel = UILabel()
  let titleLabel = UILabel()
  let datetimeLabel = UILabel()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    thumbnailImageView.contentMode = .scaleAspectFit
    namelabel.font = .systemFont(ofSize: 18, weight: .bold)
    titleLabel.font = .systemFont(ofSize: 14)
    titleLabel.numberOfLines = 2
    
    datetimeLabel.font = .systemFont(ofSize: 12, weight: .light)
    
    [thumbnailImageView, namelabel, titleLabel, datetimeLabel]
      .forEach {
        contentView.addSubview($0)
      }
    
    namelabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().inset(8)
      $0.trailing.lessThanOrEqualTo(thumbnailImageView.snp.leading).offset(-8)
    }
    
    thumbnailImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(8)
      $0.width.height.equalTo(80)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(namelabel.snp.bottom).offset(8)
      $0.leading.equalTo(namelabel)
      $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-8)
    }
    
    datetimeLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(namelabel)
      $0.trailing.equalTo(titleLabel)
      $0.bottom.equalToSuperview().inset(8)
    }
  }
  
  func setData(_ data: BlogListCellData) {
    
    thumbnailImageView.kf.setImage(with: data.thumbnailURL,
                                   placeholder: UIImage(systemName: "photo"))
    namelabel.text = data.name
    titleLabel.text = data.title
    
    var datetime: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy년 MM월 dd일"
      let currentDate = data.datetime ?? Date()
      
      return dateFormatter.string(from: currentDate)
    }
    datetimeLabel.text = datetime
  }
}


