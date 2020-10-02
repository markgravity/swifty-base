//
//  HttpService.swift
//  Moco360
//
//  Created by Mark G on 3/18/20.
//  Copyright © 2020 Mobiclix. All rights reserved.
//

import Foundation
import Alamofire
import Promises
import ObjectMapper
import SwiftyBase

public typealias HttpHeaders = HTTPHeaders
public typealias HttpMethod = HTTPMethod




public struct HttpException: Exception {
    public let error: Error?
    public let code: Int
    public let message: String?
    
    public init(error: Error?, code: Int, message: String?) {
        self.error = error
        self.code = code
        self.message = message
    }
}

public protocol HttpService {
    func request(
        method: HttpMethod,
        baseUrl: String,
        endPoint: String,
        params: HttpParametable?,
        headers: HttpHeaders?,
        interceptor: RequestInterceptor?
    ) -> Promise<Data>
    
    func upload(
        method: HTTPMethod,
        baseUrl: String,
        endPoint: String,
        params: FormDataParametable,
        headers: HTTPHeaders?,
        interceptor: RequestInterceptor?
    ) -> Promise<Data>
}

public class HttpServiceImpl: HttpService {
    fileprivate static let _session = Session()
    public init(){}
    
    public func request(
        method: HTTPMethod,
        baseUrl: String,
        endPoint: String,
        params: HttpParametable? = nil,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil
    ) -> Promise<Data> {
        
        
        // Create request
        var encoding: HttpParamsEncoding = params?.encoding ?? JsonParamsEncoding.default
        
        // Encoding for get request must be UrlParamsEncoding
        if method == .get
            && !(encoding is UrlParamsEncoding) {
            encoding = UrlParamsEncoding.default
        }
        
        let request = Self._session.request(
            "\(baseUrl)\(endPoint)",
            method: method,
            parameters: params?.toJSON(),
            encoding: encoding,
            headers: headers,
            interceptor: interceptor
        )
        
        // Execute the request
        return _excute(request: request)
    }
    
    public func upload(
        method: HTTPMethod,
        baseUrl: String,
        endPoint: String,
        params: FormDataParametable,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil
    ) -> Promise<Data> {
        
        let formData = MultipartFormData()
        for item in params.toFormData() {
            formData.append(
                item.data,
                withName: item.name,
                fileName: item.fileName,
                mimeType: item.mimeType?.rawValue
            )
        }
        
        let request = Self._session.upload(
            multipartFormData: formData,
            to: "\(baseUrl)\(endPoint)",
            method: method,
            headers: headers,
            interceptor: interceptor
        )
        
        // Execute the request
        return _excute(request: request)
    }
    
    fileprivate func _excute(request: DataRequest) -> Promise<Data> {
        
        let promise: Promise<Data> = Promise<Data>.pending()
        
        // Execute the request
        request.responseData { response in
            
            // Has error
            guard response.error == nil else {
                
                print("[http service] > error", response)
                let error = response.error! as NSError
                let exception = HttpException(
                    error: response.error!,
                    code: error.code,
                    message: error.description
                )
                promise.reject(exception)
                return;
            }
            
            // Success
            
            promise.fulfill(response.data!)
        }
        
        
        return promise
    }
    
}
