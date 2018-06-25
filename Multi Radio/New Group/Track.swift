//
//  Track.swift
//  Multi Radio
//
//  Created by Md. Nasir on 3/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//
import UIKit

//*****************************************************************
// Track struct
//*****************************************************************

struct Track {
    var title: String
    var artist: String
    var artworkImage: UIImage?
    var artworkLoaded = false
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}
