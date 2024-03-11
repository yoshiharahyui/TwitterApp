//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/02/29.
//

import Foundation
import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var postButton: UIButton!
    
    let postVC = PostViewController()
    var timelineDataList: [TimelineDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //カスタムセルを登録するコード
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        //postButtonを丸くするコード
        postButton.layer.cornerRadius = 35
        tableView.delegate = self
        postVC.delegate = self
        setTimeLineData()
        tableView.reloadData()
    }
    
    func setTimeLineData() {
        let realm = try! Realm()
        let result = realm.objects(TimelineDataModel.self)
        timelineDataList = Array(result)
    }
    
    //floatingbuttonの作成
    var startingFrame : CGRect!
    var endingFrame : CGRect!

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) && self.postButton.isHidden {
             self.postButton.isHidden = false
             self.postButton.frame = startingFrame
             UIView.animate(withDuration: 1.0) {
              self.postButton.frame = self.endingFrame
             }
            }
        }
        func configureSizes() {
            let screenSize = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height

            startingFrame = CGRect(x: 0, y: screenHeight+100, width: screenWidth, height: 100)
            endingFrame = CGRect(x: 0, y: screenHeight-100, width: screenWidth, height: 100)

        }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルをテーブルに表示
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        let timelineDataModel: TimelineDataModel = timelineDataList[indexPath.row]
        cell.username.text = timelineDataModel.username
        cell.label.text = timelineDataModel.text
        //cell.username.text = timelineDataModel.text
        return cell
    }
    //セルの高さの可変
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 30
        return UITableView.automaticDimension
    }
}
//delegateを受け取る側
extension HomeViewController: PostDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let postVC = segue.destination as! PostViewController
        postVC.delegate = self
    }
    
    func newPost(username: String, text: String) {
        self.tableView.reloadData()
        print("投稿されました\(username)と\(text)")
    }
}
