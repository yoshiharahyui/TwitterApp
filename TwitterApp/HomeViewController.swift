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
    
    var timelineDataList: [TimelineDataModel] = []
    
    @IBOutlet weak var postButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //カスタムセルを登録するコード
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        //postButtonを丸くするコード
        postButton.layer.cornerRadius = 35
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルをテーブルに表示
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        //遷移する際に遷移先にデータを表示するコード(データを送る）
        _ = storyboard?.instantiateViewController(identifier: "PostViewController") as! PostViewController
        cell.username.text = "ユーザー名"
        cell.label.text = "テキスト"
        return cell
    }
    //セルの高さの可変
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 50
        return UITableView.automaticDimension
    }
}
