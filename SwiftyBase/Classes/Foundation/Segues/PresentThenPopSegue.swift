//
//  PresentThenPopSegue.swift
//  Moco360
//
//  Created by Mark G on 8/7/18.
//  Copyright © 2018 Mobiclix. All rights reserved.
//

import UIKit

public class PresentThenPopSegue: UIStoryboardSegue {
    public override func perform() {
        source.present(destination, animated: true)
    }
}
