//
//  goalsTableViewCell.swift
//  John Fish App 01
//
//  Created by Mallah  on 4/14/19.
//  Copyright © 2019 Mallah . All rights reserved.
//

import UIKit

class goalsTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var goalsTextField: UITextField!
    @IBOutlet weak var goalsCheckBox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.goalsTextField.delegate = self
        
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


