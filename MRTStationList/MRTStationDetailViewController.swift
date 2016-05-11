//
//  MRTStationDetailViewController.swift
//  MRTStationList
//
//  Created by blackzid on 2016/5/10.
//  Copyright © 2016年 nccu. All rights reserved.
//

import UIKit

class MRTStationDetailViewController: UIViewController {

    @IBOutlet var stationNameLabel: UILabel!
    @IBOutlet var secondLineNameLabel: UILabel!
    @IBOutlet var firstLineNameLabel: UILabel!
    
    @IBOutlet var singleLineNameLabel: UILabel!
    var station: MRTStation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let station = self.station {
            stationNameLabel.text? = station.name!
            let labels = [firstLineNameLabel, secondLineNameLabel]
            var i = 0
            if station.lines!.count == 1 {
                for (lineName, _) in station.lines! {
                    let colorTuple = MRTLines.colorTable[lineName]!
                    let color = UIColor(red: colorTuple.0/255, green: colorTuple.1/255, blue: colorTuple.2/255, alpha: 1)
                    singleLineNameLabel.backgroundColor = color
                    singleLineNameLabel.text = lineName
                }
            }
            else {
                for (lineName, _) in station.lines! {
                    let colorTuple = MRTLines.colorTable[lineName]!
                    let color = UIColor(red: colorTuple.0/255, green: colorTuple.1/255, blue: colorTuple.2/255, alpha: 1)
                    
                    labels[i].backgroundColor = color
                    labels[i].text = lineName
                    i += 1
                }
            }
            
        }
        // Do any additional setup after loading the view.
    }


}
