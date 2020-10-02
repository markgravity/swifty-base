//
//  FormDataParameterable.swift
//  Moco360
//
//  Created by Mark G on 5/11/20.
//  Copyright © 2020 Mobiclix. All rights reserved.
//

import Foundation

public struct FormDataItem {
    let data: Data
    let name: String
    let fileName: String?
    let mimeType: MimeType?
}

public protocol FormDataParametable {

    func toFormData() -> [FormDataItem]
}
