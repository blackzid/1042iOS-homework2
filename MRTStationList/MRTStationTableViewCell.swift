//
//  MRTStationTableViewCell.swift
//  MRTStationList
//
//  Created by blackzid on 2016/5/10.
//  Copyright © 2016年 nccu. All rights reserved.
//

import UIKit

class MRTStationTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var firstLineLabel: UILabel!
    @IBOutlet var secondLineLabel: UILabel!
    var station: MRTStation? {
        didSet{
            firstLineLabel.backgroundColor = UIColor.whiteColor()
            firstLineLabel.text = ""
            secondLineLabel.backgroundColor = UIColor.whiteColor()
            secondLineLabel.text = ""
            
            if let station = self.station {
                
                nameLabel.text? = station.name!
                let labels = [firstLineLabel, secondLineLabel]
                var i = 0
                for (lineName, lineCode) in station.lines! {
                    let colorTuple = MRTLines.colorTable[lineName]!
                    let color = UIColor(red: colorTuple.0/255, green: colorTuple.1/255, blue: colorTuple.2/255, alpha: 1)

                    labels[i].backgroundColor = color
                    labels[i].text = lineCode
                    i += 1
                }
                if station.lines!.count == 1 {
                    
                }
            }
        }
    }
}
