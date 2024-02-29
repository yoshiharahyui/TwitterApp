//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/02/29.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var TimelineDataList: [TimelineDataModel] = []
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        setTimelineData()
    }
    
    func setTimelineData() {
        for i in 1...5 {
            let timelineDataModel = TimelineDataModel(text: "このタイムラインは(i)番目のタイムラインです")
            TimelineDataList.append(timelineDataModel)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimelineDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let timelineDataModel: TimelineDataModel = TimelineDataList[indexPath.row]
        cell.textLabel?.text = timelineDataModel.text
        return cell
    }
}
