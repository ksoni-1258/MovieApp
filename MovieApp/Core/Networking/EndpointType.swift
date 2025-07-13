//
//  EndpointType.swift
//  MovieApp
//
//  Created by Kishan Soni on 11/07/25.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias QueryList = [URLQueryItem]
public typealias BodyDict = [String: Sendable]
public typealias ParamBodyHeaderList = (params: QueryList?, bodyDict: BodyDict?, headers: HTTPHeaders?)

protocol EndpointType {
    var baseURL: BaseUrl { get }
    var path: String { get }
    var httpMethod: HttpMethodType { get }
    var paramsBodyHeader: ParamBodyHeaderList { get }
}
