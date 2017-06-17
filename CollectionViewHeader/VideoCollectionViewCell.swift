//
//  VideoCollectionViewCell.swift
//  Mooc
//
//  Created by 77 on 2017/4/28.
//  Copyright © 2017年 太阳在线. All rights reserved.
//

import UIKit




protocol VideoCollectionViewCellUserImageDelegate:class {
    func imageAction(cell: UICollectionViewCell)
}

protocol VideoCollectionViewCellMoreActionDelegate:class {
    func moreAction(cell: UICollectionViewCell)
}

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    weak var delegate: VideoCollectionViewCellUserImageDelegate?
    weak var moreActionDelegate: VideoCollectionViewCellMoreActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = 44/2
        videoImage.layer.masksToBounds = true
        videoImage.layer.cornerRadius = 10
        userImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(userImageTap))
        userImage.addGestureRecognizer(tap)
    }

    @objc func userImageTap() {
        delegate?.imageAction(cell: self)
    }
    
    @IBAction func moreButtonAction(_ sender: Any) {
        moreActionDelegate?.moreAction(cell: self)
    }

}
