//
//  HorizontalSlideTableViewController.swift
//  SideScrollCells
//
//  Created by Daniel Oram on 9/11/16.
//  Copyright © 2016 Daniel Oram. All rights reserved.
//

import UIKit

class HorizontalSlideTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let model: [[UIColor]] = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    
    var cellCharLabel: UILabel!
    
//    var cellCharLabel: UILabel {
//        get {
//            if self.cellCharLabel != nil {
//                return self.cellCharLabel
//            } else {
//                let label = UILabel()
//                return label
//            }
//        }
//        
//        set(newLabel) {
//            if let label = newLabel as UILabel? {
//                self.cellCharLabel = label
//            }
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return Languages.sharedInstance.alphabets.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //one row per language
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalSlideCell", for: indexPath)
        //let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // Configure the cell...
        
        //cell.textLabel?.text = String(dummyCellData[indexPath.row])

        return cell
    }
    
    //called before cells displayed
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? HorizontalSlideTableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    //called after cell displayed
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? HorizontalSlideTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    
    //add custom headerview to table
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//        header.backgroundColor = UIColor.red
//        
//        return header
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return Languages.sharedInstance.alphabets[section].name
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}



extension HorizontalSlideTableViewController {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return Languages.sharedInstance.alphabets[section].set.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerCollectionViewCell",
                                                      for: indexPath as IndexPath)
        
        //format inner collectionview cells
        
        //cell.backgroundColor = model[collectionView.tag][indexPath.item]
        
//        cell.layer.borderWidth = 1.0
//        cell.layer.borderColor = UIColor.black.cgColor
        
        //remove cellCharLabel view to stop redrawing over top when reused
        
        if let labelToRemove = cell.viewWithTag(1) {
            labelToRemove.removeFromSuperview()
        }
        
        //add label with Character
        
        cellCharLabel = UILabel(frame: cell.bounds)
        cellCharLabel?.tag = 1
        
        cellCharLabel?.text = Languages.sharedInstance.alphabets[collectionView.tag].set[indexPath.row].char
        cellCharLabel?.textAlignment = .center
        cellCharLabel?.font = UIFont(name: "Helvetica", size: 40)
        
        cell.contentView.addSubview(cellCharLabel!)
        
        return cell
    }
}

