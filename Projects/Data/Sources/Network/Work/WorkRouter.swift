//
//  WorkRouter.swift
//  Data
//
//  Created by 김혜수 on 2023/01/28.
//  Copyright © 2023 com.workit. All rights reserved.
//

import Foundation

import Alamofire

public enum WorkRouter {
    /// 전체 워킷 보기
    case fetchWorks
    /// 전체 워킷 보기 (기간별)
    case fetchWorksDate(start: Date, end: Date)
    /// 워킷 상세 조회
    case fetchWorkDetail(workId: Int)
}

extension WorkRouter: BaseRequestConvertible {
    
    var method: HTTPMethod {
        switch self {
        case .fetchWorks:
            return .get
        case .fetchWorksDate:
            return .get
        case .fetchWorkDetail:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchWorks:
            return URLConstant.work
        case .fetchWorksDate:
            return URLConstant.work + "/date"
        case .fetchWorkDetail(let workId):
            return URLConstant.work + "/\(workId)"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchWorks:
            return nil
        case let .fetchWorksDate(start, end):
            return ["start": start.toString(type: .fullYearDash),
                    "end": end.toString(type: .fullYearDash)]
        case .fetchWorkDetail:
            return nil
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .fetchWorks:
           break
        case .fetchWorksDate:
            request = try URLEncoding.queryString.encode(request, with: parameters)
        case .fetchWorkDetail:
            break
        }
      
        return request
    }
}
