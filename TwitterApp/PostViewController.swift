//
//  PostViewController.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/03/02.
//

import Foundation
import UIKit
import RealmSwift


class PostViewController: UIViewController {

    let realm = try! Realm()
//遷移元へのキャンセルボタン
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //投稿ボタン
    @IBAction func toPostButtonAction(_ sender: Any) {
        var username: String
        var text: String
        username = addusername.text ?? ""
        text = textViewShow.text
        self.saveData(with: username, with: text)
        print("\(username)")
    }
    
    @IBOutlet weak var addusername: UITextField!
    
    @IBOutlet weak var textViewShow: UITextView!
    //var username: String = ""
    //var text: String = ""
    var timelineData = TimelineDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        setDoneButton()
        addusername.delegate = self
        textViewShow.delegate = self
    }
    //データを受け入れるため(
    func configure(timeline: TimelineDataModel) {
        timelineData.username = timeline.username
        timelineData.text = timeline.text
            //print("データは\(text)と\(recordDate)です！")
        }
    
    //キーボードを消すDoneボタン
    @objc func tapDoneButton() {
            view.endEditing(true)
        }
    //キーボードを表示やDoneボタンを実行するように
    func setDoneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDoneButton))
        toolBar.items = [commitButton]
        addusername.inputAccessoryView = toolBar
        textViewShow.inputAccessoryView = toolBar
    }
    //データの保存
    func saveData(with username: String, with text: String) {
        let timelineData = TimelineDataModel()
        timelineData.username = addusername.text ?? ""
        timelineData.text = textViewShow.text
        try! realm.write {
        realm.add(timelineData)
        }
        print("確認\(timelineData)")
    }
}
//データを変更したときにデータが上書きされていくためのコード
extension PostViewController: UITextViewDelegate, UITextFieldDelegate {
    //func textFieldDidChange(_ textField: UITextField) {
        //let updatedName = addusername.text ?? ""
        //let updatedText = textViewShow.text ?? ""
        //saveData(with: updatedName, with: updatedText)
    //}
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let updatedName = addusername.text ?? ""
         let updatedText = textViewShow.text ?? ""
         saveData(with: updatedName, with: updatedText)
    }
    func textViewDidChange(_ textView: UITextView) {
       let updatedName = addusername.text ?? ""
        let updatedText = textViewShow.text ?? ""
        saveData(with: updatedName, with: updatedText)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}
