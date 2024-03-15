//
//  PostViewController.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/03/02.
//

import Foundation
import UIKit
import RealmSwift


protocol PostDelegate {
    func newPost(username: String, text: String)
}

class PostViewController: UIViewController {

    var  delegate: PostDelegate?
    let realm = try! Realm()
//遷移元へのキャンセルボタン
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //投稿ボタン
    @IBAction func toPostButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        var username: String
        var text: String
        username = addusername.text ?? ""
        text = textViewShow.text
        self.saveData(with: username, with: text)
        delegate?.newPost(username: username, text: text)
    }
    @IBOutlet weak var toPostButtonAction: UIBarButtonItem!
    
    @IBOutlet weak var addusername: UITextField!
    
    @IBOutlet weak var textViewShow: UITextView!

    var timelineData = TimelineDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let realm = try! Realm()
        setDoneButton()
        addusername.delegate = self
        textViewShow.delegate = self
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
    //リターンを押すとキーボードがしまわれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
    func textViewDidChange(_ textView: UITextView) {
        if textViewShow.text.count >= 141 {
            toPostButtonAction.isEnabled = false
        } else {
            toPostButtonAction.isEnabled = true
        }
    }
}
