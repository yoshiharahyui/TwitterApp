//
//  PostViewController.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/03/02.
//

import Foundation
import UIKit


class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
