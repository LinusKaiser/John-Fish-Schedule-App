//
//  toDoTableViewCell.swift
//  John Fish App 01
//
//  Created by Mallah  on 4/14/19.
//  Copyright © 2019 Mallah . All rights reserved.
//

import UIKit

class toDoTableViewCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var toDoCheckBox: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.toDoTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
