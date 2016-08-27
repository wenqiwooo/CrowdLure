//
//  Endpoint.swift
//  iOS Starter
//
//  Created by Gerald on 22/8/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import Alamofire
import SwiftyJSON

/**
 Wrapper class for all server side APIs.

 ````
 // use case
 request(Endpoint.service(args...))
 ````
 */
enum Endpoint: URLRequestConvertible {
    // update with your end point
    static let baseURL = "https://sheltered-bayou-29760.herokuapp.com/"

    // MARK: Endpoints

    // MARK:- Auth
    case authUser(accessToken: String)
    case authBiz(username: String, password: String)

    // MARK:- Biz
    case getBusinesses
    case getBusiness(id: Int)
    case searchBusiness(query: String)
    case updateBusiness(id: Int, name: String, description: String, logoURL: String)

    // MARK:- Lures
    case getLures
    case getLure(id: Int)
    case getBizLures(bizID: Int)
    case searchLure(query: String)
    case makeLure(title: String, description: String, location: String, startDate: NSDate, endDate: NSDate, target: [[String: AnyObject]])
    case updateLure(id: Int, title: String, description: String, location: String, startDate: NSDate, endDate: NSDate, target: [[String: AnyObject]])
    case deleteLure(id: Int)

    // MARK:- Choice for Poll
    // pass nil to choice to clear previous selections
    // this is for customers to use
    case submitChoiceForPoll(bizID: Int, pollID: Int, choice: Int?)

    // MARK:- Polls
    case getBizPoll(bizID: Int, pollID: Int)
    case getBizPolls(bizID: Int)
    case createPoll(bizID: Int, title: String, startDate: NSDate, endDate: NSDate, choices: [String])
    case deletePoll(bizID: Int, pollID: Int)
    case updatePoll(bizID: Int, pollID: Int, title: String, startDate: NSDate, endDate: NSDate, choices: [String])


    // MARK: - Endpoints params
    var URLRequest: NSMutableURLRequest {
        let url = NSURL(string: Endpoint.baseURL)!
        let mutableURLRequest = NSMutableURLRequest(URL: url.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        var param = [String: AnyObject]()

        switch self {
        case let .authUser(accessToken):
            param = ["facebook_access_token": accessToken]
        case let .authBiz(username, password):
            param = ["username": username, "password": password]
        case .getBusinesses, .getBusiness:
            break

        case .searchBusiness(let query):
            param = ["query": query]

        case let .updateBusiness(_, name, description, logoURL):
            param = ["name": name, "description": description, "logoURL": logoURL]

        case .getLures, getLure, .getBizLures:
            break

        case .searchLure(let query):
            param = ["query": query]

        case let .makeLure(title, description, location, startDate, endDate, target):
            param = ["title": title, "description": description, "location": location, "startDate": startDate, "endDate": endDate, "target": target]


        case let .updateLure(_, title, description, location, startDate, endDate, target):
            param = ["title": title, "description": description, "location": location, "startDate": startDate, "endDate": endDate, "target": target]

        case .deleteLure:
            break


        case let .submitChoiceForPoll(_, _, choice):
            if let choice = choice {
                param = ["choice": choice]
            } else {
                break
            }

        case .getBizPoll, getBizPolls:
            break

        case let .createPoll(_, title, startDate, endDate, choices):
            param = ["title": title, "startDate": startDate, "endDate": endDate, "choices": choices]

        case .deletePoll:
            break

        case let .updatePoll(_, _, title, startDate, endDate, choices):
            param = ["title": title, "startDate": startDate, "endDate": endDate, "choices": choices]
        }

        if method == .POST || method == .PUT {
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: param).0
        } else {
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: param).0
        }
    }

    // MARK:- Request Methods
    var method: Alamofire.Method {
        switch self {
        case .authUser,
             .authBiz,
             .makeLure,
             .submitChoiceForPoll,
             .createPoll:

            return .POST

        case .getBusinesses,
             .getBusiness,
             .searchBusiness,
             .getLure,
             .getBizLures,
             .getLures,
             .searchLure,
             .getBizPoll,
             .getBizPolls:

            return .GET

        case .updateBusiness,
             .updateLure,
             .updatePoll:
            return .PUT

        case .deleteLure,
             .deletePoll:
            return .DELETE
        }
    }

    // MARK:- Endpoints
    var path: String {
        switch self {
        case .authUser: return "/auth/user"
        case .authBiz: return "/auth/business"
        case .getBusinesses: return "/getBusinesses"
        case .getBusiness(let id): return "/business/\(id)"
        case .searchBusiness: return "/business/search"
        case .updateBusiness(let id): return "/businesses/\(id)"

        case .getLure(let id): return "/lure/\(id)"
        case .getBizLures(let bizID): return "/businesses/\(bizID)/lures"
        case .getLures: return "/lures"
        case .searchLure: return "/lures/search"
        case .makeLure: return "/lure"
        case let .updateLure(id, _, _, _, _, _, _): return "/lure/\(id)"
        case let .deleteLure(id): return "/lure/\(id)"

        case let .submitChoiceForPoll(bizID, pollID, _): return "/businesses/\(bizID)/polls/\(pollID)"

        case let .getBizPoll(bizID, pollID): return "/businesses/\(bizID)/polls/\(pollID)"
        case let .getBizPolls(bizID): return "/businesses/\(bizID)/polls"
        case let .createPoll(bizID, _, _, _, _): return "/businesses/\(bizID)/polls"
        case let .updatePoll(bizID, pollID, _, _, _, _): return "/businesses/\(bizID)/polls/\(pollID)"
        case let .deletePoll(bizID, pollID): return "/businesses/\(bizID)/polls/\(pollID)"
        }
    }
}
