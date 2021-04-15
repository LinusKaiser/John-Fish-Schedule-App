//
//  ScheduleArray+CoreDataProperties.swift
//  John Fish App 03
//
//  Created by Mallah  on 5/13/19.
//  Copyright © 2019 Mallah . All rights reserved.
//
//

import Foundation
import CoreData


extension ScheduleArray {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduleArray> {
        return NSFetchRequest<ScheduleArray>(entityName: "ScheduleArray")
    }

    @NSManaged public var id: Int16
    @NSManaged public var textButtonState: Bool
    @NSManaged public var timeButtonState: Bool
    @NSManaged public var text: String
    @NSManaged public var time01: String
    @NSManaged public var time02: String

}
