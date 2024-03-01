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
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        //tableView.dataSource = self
        //tableView.tableFooterView = UIView()
        //setTimelineData()
    }
    
    func setTimelineData() {
        for i in 1...5 {
            //let timelineDataModel = TimelineDataModel(username: "このタイムラインは(i)番目のタイムラインです")
            //TimelineDataList.append(timelineDataModel)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルをテーブルに表示
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        //let timelineDataModel: TimelineDataModel = TimelineDataList[indexPath.row]
        cell.username.text = "ユーザー名"
        cell.label.text = "テキストテキストテキスト"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 50
        return UITableView.automaticDimension
    }
}
