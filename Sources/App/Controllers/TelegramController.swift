//
//  TelegramController.swift
//  ShitPosterApi
//
//  Created by Koray Koska on 17/05/2017.
//
//

import Foundation
import HTTP
import Vapor

class TelegramController {

    func telegramBaseRequest(_ req: Request) throws -> ResponseRepresentable {

        return try JSON(node: [
            "success": true
            ])
    }

}
