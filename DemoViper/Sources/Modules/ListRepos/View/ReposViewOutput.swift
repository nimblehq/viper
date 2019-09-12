//
//  ReposViewOutput.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol ReposViewOutput: AnyObject {
    func viewDidLoad()
    func detail(at index: Int)
}
