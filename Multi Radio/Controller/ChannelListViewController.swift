//
//  ChannelListViewController.swift
//  Multi Radio
//
//  Created by Md. Nasir on 24/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import UIKit
import Alamofire

class ChannelListViewController: UIViewController {

    @IBOutlet weak var categoryNameLabel: UILabel!
    var categoryName:String?
    let url: String = HttpParams.BASE_URL + HttpParams.SHEET_ID + "&" + HttpParams.SHEET_CHANNEL_LIST
    
    var channelsData = [ChannelList]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiCall = AlamofireWrapper.sharedInstance.getCostumers(url)
            apiCall.done{
                channels -> Void in
                self.channelsData = channels
                print(self.channelsData.count)
            }.catch{
                error -> Void in
            }
        
        
        if let nameToDisplay = categoryName{
            categoryNameLabel.text = nameToDisplay
        }
        
    }
    
}
