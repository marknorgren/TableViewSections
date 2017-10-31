//
//  ViewController.swift
//  TableViewSections
//
//  Created by Mark Norgren on 10/31/17.
//  Copyright © 2017 Marked Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = SectionExampleTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editTapped(_ sender: UIButton) {
        tableView.isEditing ? (tableView.setEditing(false, animated: true)) : (tableView.setEditing(true, animated: true))
    }

}

class SectionExampleTableViewDataSource: NSObject, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }


    // This needs to be implemented before the move icons are shown
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        return
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell.detailTextLabel?.text = "\(indexPath.row)"
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

