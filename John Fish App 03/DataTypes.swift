//
//  DataTypes.swift
//  John Fish App 01
//
//  Created by Mallah  on 5/8/19.
//  Copyright © 2019 Mallah . All rights reserved.
//

import Foundation
import UIKit


//DataTypes

struct ScheduleCell{
    
    var id: Int
    var textButtonState: Bool
    var timeButtonState: Bool
    var text: String
    var time01: String
    var time02: String
    
}


struct GoalsCell{
    
    var id: Int
    var buttonState: Bool
    var text: String
    
}

struct ToDoCell{
    
    var id: Int
    var buttonState: Bool
    var text: String
    
}

struct MotivationCell{
    
    var id: Int
    var text: UITextField
    
}







//Extentions

public extension UITableView {
    
    /**
     This method returns the indexPath of the cell that contains the specified view
     
     - Parameter view: The view to find.
     
     - Returns: The indexPath of the cell containing the view, or nil if it can't be found
     
     */
    
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let center = view.center
        
        //The center of the view is a better point to use, but we can only use it if the view has a superview
        guard let superview = view.superview else {
            //The view we were passed does not have a valid superview.
            //Use the view's bounds.origin and convert from the view's coordinate system
            let origin = self.convert(view.bounds.origin, from: view)
            let indexPath = self.indexPathForRow(at: origin)
            return indexPath
        }
        let viewCenter = self.convert(center, from: superview)
        let indexPath = self.indexPathForRow(at: viewCenter)
        return indexPath
    }
}
