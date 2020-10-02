//
//  ApiResponse.swift
//  Moco360
//
//  Created by Mark G on 3/19/20.
//  Copyright © 2020 Mobiclix. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

public struct ApiResponse {
    public let response: [String:JSON]
    
    public init(response: [String:JSON]) {
        self.response = response
    }
    
    public func asObject<T: Mappable>() -> T {
        return T(JSON: response["data"]!.dictionaryObject!)!
    }
    
    public func asList<T: ListResponsable>() -> T {
        
        // TODO: Use ListResponsable(JSON:) insteads
        guard let items = response["data"]?.arrayObject?.map ({
            T.Element(JSON: $0 as! [String:Any])!
        }) else {
            return ListResponse<T.Element>() as! T
        }
        let list = ListResponse(items: items)
       
        return list as! T
    }
    
    public func asVoid()-> Void {
        return;
    }
}
