//
//  motivationTableViewCell.swift
//  John Fish App 01
//
//  Created by Mallah  on 4/13/19.
//  Copyright © 2019 Mallah . All rights reserved.
//

import UIKit

class motivationTableViewCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet weak var motivationImage: UIImageView!
    @IBOutlet weak var motivationTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        motivationImage.clipsToBounds = true
        motivationImage.layer.cornerRadius = 15
       
        self.motivationTextField.delegate = self
        
    }

    func setImage(image: UIImage){
        
        
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
