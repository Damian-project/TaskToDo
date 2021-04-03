//
//  Item.swift
//  TaskToDo
//
//  Created by PC on 05/03/2021.
//  Copyright © 2021 db. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
