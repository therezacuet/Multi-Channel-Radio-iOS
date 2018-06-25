//
//  ChannelListViewController.swift
//  Multi Radio
//
//  Created by Md. Nasir on 24/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import UIKit

class ChannelListViewController: UIViewController {

    @IBOutlet weak var categoryNameLabel: UILabel!
    var categoryName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let nameToDisplay = categoryName{
            categoryNameLabel.text = nameToDisplay
        }
    }

}
