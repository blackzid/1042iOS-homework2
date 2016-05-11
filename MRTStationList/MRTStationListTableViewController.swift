//
//  MRTStationListTableViewController.swift
//  MRTStationList
//
//  Created by blackzid on 2016/5/10.
//  Copyright © 2016年 nccu. All rights reserved.
//

import UIKit

struct Constant {
    static let MRTStationCellIdentifier = "MRTStationCell"
    static let showDetailSegueIdentifier = "ShowDetail"
}

class MRTStationListTableViewController: UITableViewController {
    var stationManager: MRTStationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let MRTJSONString = NSBundle.mainBundle().pathForResource("MRT", ofType: "json")!
        stationManager = MRTStationManager(contentsOfFile: MRTJSONString)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return stationManager.lines.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return stationManager.lines[section].0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stationManager.lines[section].1.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.MRTStationCellIdentifier, forIndexPath: indexPath) as! MRTStationTableViewCell
        cell.station = stationManager.lines[indexPath.section].1[indexPath.row]
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constant.showDetailSegueIdentifier {
            if let vc = segue.destinationViewController as? MRTStationDetailViewController {
                if let cell = sender as? MRTStationTableViewCell{
                    vc.station = cell.station
                }
            }
        }
    }
}
