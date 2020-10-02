//
//  UIColor.swift
//  SwiftyBase
//
//  Created by Mark G on 26/09/2020.
//

import UIKit

public extension UIColor {
    static func hex(_ string: String) -> UIColor {
        UIColor(hexString: string)
    }
}
