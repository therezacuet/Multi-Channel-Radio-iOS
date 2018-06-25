//
//  ViewController.swift
//  Multi Radio
//
//  Created by Md. Nasir on 31/5/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import UIKit
import MediaPlayer
import FRadioPlayer
import AVFoundation

protocol NowPlayingViewControllerDelegate: class {
    func didPressPlayingButton()
    func didPressStopButton()
    func didPressNextButton()
    func didPressPreviousButton()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // These strings will be the data for the table view cells
    let categories: [String] = ["Music", "Entertainment", "Sports", "News", "Rock","Live News","Classic","Metal","Weather", "Comedy"]
    
    // These are the colors of the square views in our table view cells.
    // In a real project you might use UIImages.
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown,UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    
    var valueToPass:String!
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "cell"
    @IBOutlet weak var categoryTableView: UITableView!
    
    weak var delegate: NowPlayingViewControllerDelegate?
    
     // MARK: - IB UI
    @IBOutlet weak var playPauseButton: UIImageView!
    
    
    // MARK: - Properties
    
    let radioPlayer = RadioPlayer()
    var isPlay: Bool = false
    
    let screenSize: CGRect = UIScreen.main.bounds;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDetected))
        playPauseButton.isUserInteractionEnabled = true
        playPauseButton.addGestureRecognizer(singleTap)
        
        // Setup Player
        radioPlayer.delegate = self as? RadioPlayerDelegate
        
        // Activate audioSession
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("audioSession could not be activated")
        }
    
    }
    
    // Actions
    
    @objc func tapDetected() {
       let myView = SpinnerView(frame: CGRect(x: screenSize.width/2, y: screenSize.height/2, width: 100, height: 100));
    
        if(isPlay){
            
            self.view.addSubview(myView)
            playPauseButton.image = #imageLiteral(resourceName: "btn-play")
            radioPlayer.player.stop()
            isPlay = false
        }else{
        
            self.view.willRemoveSubview(myView)
            playPauseButton.image = #imageLiteral(resourceName: "btn-pause")
            radioPlayer.player.radioURL = URL(string: "http://119.148.23.88:1021/")
            radioPlayer.player.play()
            isPlay = true
        }
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CategoryCellViewTableViewCell = self.categoryTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CategoryCellViewTableViewCell
        
        cell.categoryImageView.backgroundColor = self.colors[indexPath.row]
        cell.categoryNameLabel.text = self.categories[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    
        let selectedCell = categoryTableView.cellForRow(at: indexPath) as! CategoryCellViewTableViewCell
        
        valueToPass = selectedCell.categoryNameLabel.text

        self.performSegue(withIdentifier: "channelList", sender: self)
        
        print(""+valueToPass)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ChannelListViewController{
            destination.categoryName = valueToPass
        }
    }
    
}

