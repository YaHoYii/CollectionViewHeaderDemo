//
//  SubscribeViewController.swift
//  Mooc
//
//  Created by 77 on 2017/4/28.
//  Copyright © 2017年 太阳在线. All rights reserved.
//  订阅内容

import UIKit
import SnapKit

class SubscribeViewController: UIViewController {

	var vcollectionView: UICollectionView!   // 竖着的
	var headerView: UIView!

	var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.white
		
		setcollectionView()

    }

	
	func setcollectionView() {
		
		
		vcollectionView = {
			let layout = UICollectionViewFlowLayout()
			let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
			collectionView.backgroundColor = UIColor.white
			collectionView.delegate = self
			collectionView.dataSource = self
			
			collectionView.register(UINib(nibName: "VideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionViewCell")
			
			collectionView.register(YHYCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
			
			return collectionView
			
		}()
		
		
		view.addSubview(vcollectionView)
		
		vcollectionView.snp.makeConstraints { (make) in
			make.bottom.leading.trailing.equalToSuperview()
			make.top.equalToSuperview().offset(0)
		}

	}
	
}

extension SubscribeViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

			let width = view.bounds.width
			let height = width * 9.0 / 16.0 + 70.0
			return CGSize(width: width, height: height)

	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		
		 return 0
		
	}
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		 return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: self.view.frame.width, height: 64)
	}
	
	
}

extension SubscribeViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	
		
	}
	
}

extension SubscribeViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
	
		return 1

	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell

		return cell
	
	}
	
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		// 此处的 kind 是String 类型的 包括了两个一个是： UICollectionElementKindSectionHeader （SectionHeader视图）   另一个是：UICollectionElementKindSectionFooter  （SectionFooter视图）
		switch kind {
			
		case UICollectionElementKindSectionHeader:
			
			let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! YHYCollectionReusableView
			headerView.backgroundColor = UIColor.yellow

			return headerView
	
		default:
			
			assert(false, "Unexpected element kind")
		}

	}
	
}









