//
//  MainTableViewCell.swift
//  TwitterApp
//
//  Created by 吉原飛偉 on 2024/03/01.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var label: UILabel!
    
    //var name: String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
