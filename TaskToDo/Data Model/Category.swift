//
//  Category.swift
//  TaskToDo
//
//  Created by PC on 16/03/2021.
//  Copyright © 2021 db. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}
