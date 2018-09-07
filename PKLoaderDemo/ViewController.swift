//
//  ViewController.swift
//  PKLoaderDemo
//
//  Created by Pramod Kumar on 06/09/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadMeButton: UIButton!
    
    var allTypes: [String] = ["Activity Indicator", "Ball Spin Fade", "Ball Rotate Chase", "Ball Clip Rotate", "Circle Stroke Spin"]
    var currentSeelctedIndex: Int = 0 {
        didSet{
            switch currentSeelctedIndex {
            case 0:
                PKLoaderSettings.shared.indicatorType = .activityIndicator
                
            case 1:
                PKLoaderSettings.shared.indicatorType = .ballSpinFade
                
            case 2:
                PKLoaderSettings.shared.indicatorType = .ballRotateChase
                
            case 3:
                PKLoaderSettings.shared.indicatorType = .ballClipRotate
                
            case 4:
                PKLoaderSettings.shared.indicatorType = .circleStrokeSpin
                
            default:
                PKLoaderSettings.shared.indicatorType = .activityIndicator
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadMeButton.layer.cornerRadius = loadMeButton.frame.height / 2.0
        self.loadMeButton.layer.masksToBounds = true
        
        self.currentSeelctedIndex = 0
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadMeRedButtonAction(_ sender: UIButton) {
        PKLoader.shared.startAnimating(onView: sender)
        
        DispatchQueue.delay(2.0) {
            PKLoader.shared.stopAnimating()
        }
    }
    
    
    @IBAction func loadMeAction(_ sender: UIButton) {
        PKLoader.shared.startAnimating()
        
        DispatchQueue.delay(2.0) {
            PKLoader.shared.stopAnimating()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = self.allTypes[indexPath.row]
        cell.nameLabel.textColor = indexPath.row == currentSeelctedIndex ? UIColor.black : UIColor.lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentSeelctedIndex = indexPath.row
        self.tableView.reloadData()
    }
}

class TableCell: UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
}



extension DispatchQueue{
    
    ///Delays the executon of 'closer' block upto a given time
    class func delay(_ delay:Double, closure:@escaping ()->()) {
        
        self.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: closure
        )
    }
}

