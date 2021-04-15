//
//  scheduleTableViewCell.swift
//  John Fish App 01
//
//  Created by Mallah  on 4/14/19.
//  Copyright © 2019 Mallah . All rights reserved.
//

import UIKit

class scheduleTableViewCell: UITableViewCell, UITextFieldDelegate {

   
    
    
    @IBOutlet weak var scheduleStartTimeField: UITextField!
    @IBOutlet weak var scheduleEndTimeField: UITextField!
    @IBOutlet weak var scheduleDateCheckBox: UIButton!
    @IBOutlet weak var scheduleTextField: UITextField!
    @IBOutlet weak var scheduleTextCheckBox: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.scheduleStartTimeField.delegate = self
        self.scheduleEndTimeField.delegate = self
        self.scheduleTextField.delegate = self
        
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
