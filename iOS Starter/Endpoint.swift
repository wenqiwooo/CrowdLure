//
//  Endpoint.swift
//  iOS Starter
//
//  Created by Gerald on 22/8/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import Alamofire

/**
 Wrapper class for all server side APIs.

 ````
 // use case
 request(Endpoint.service(args...))
 ````
 */
enum Endpoint: URLRequestConvertible {
    // update with your end point
    static let baseURL = "https://testing.com/api/"

    // MARK: -
    case login(email: String, password: String)
    case register(name: String, email: String, password: String)
    case forgotPassword(email: String)
    case balance(accessToken: String)

    // MARK: -
    var URLRequest: NSMutableURLRequest {
        let url = NSURL(string: Endpoint.baseURL)!
        let mutableURLRequest = NSMutableURLRequest(URL: url.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        var param = [String: String]()

        /*
        switch self {
        case let .login(email, password):
            param = [ReqParam.email.rawValue: email, ReqParam.password.rawValue: password]

        case let .register(name, email, password):
            param = [ReqParam.name.rawValue: name,
                     ReqParam.email.rawValue: email,
                     ReqParam.password.rawValue: password]

        case let .forgotPassword(email):
            param = [ReqParam.email.rawValue: email]

        case let .balance(accessToken):
            param = [ReqParam.accessToken.rawValue: accessToken]
        }
         */

        return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: param).0
    }

    var method: Alamofire.Method {
        switch self {
        case .login,
             .register,
             .forgotPassword:

            return .POST

        case .balance:

            return .GET

        }
    }

    var path: String {
        switch self {
        case .login: return "/auth/authenticate"
        case .register: return "/auth/sign_up"
        case .forgotPassword: return "/auth/forgot_password"
        case .balance: return "/wallet"
//        case .renameAddress(_, _, let addressID): return "/addresses/\(addressID)/rename"
        }
    }
}
