//
//  YHYCollectionReusableView.swift
//  CollectionViewHeader
//
//  Created by 太阳在线YHY on 2017/6/17.
//  Copyright © 2017年 太阳在线. All rights reserved.
//

import UIKit
import SnapKit

class YHYCollectionReusableView: UICollectionReusableView {
	
	//  在这里写 headerView 的布局
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		let button = UIButton()
		button.backgroundColor = UIColor.blue
		self.addSubview(button)
		button.snp.makeConstraints { (make) in
			make.width.height.equalTo(64)
			make.centerY.equalToSuperview()
		}
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
}
