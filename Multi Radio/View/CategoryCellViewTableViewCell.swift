//
//  CategoryCellViewTableViewCell.swift
//  Multi Radio
//
//  Created by Md. Nasir on 24/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import UIKit

class CategoryCellViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImageView: UIView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
