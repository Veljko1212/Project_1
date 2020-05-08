//
//  CollectionViewCell.swift
//  HangmaN
//
//  Created by Veljko Milosevic on 05/01/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }

}
