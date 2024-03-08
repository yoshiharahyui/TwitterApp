//
//  TimelineDataModel.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/02/29.
//

import Foundation
import RealmSwift


class TimelineDataModel: Object {
    @objc dynamic var id: String = UUID().uuidString //データを一意に識別するための識別子
    @objc dynamic var username: String = ""
    @objc dynamic var text: String = ""
}
