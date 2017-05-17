//
//  Chat.swift
//  ShitPosterApi
//
//  Created by Koray Koska on 17/05/2017.
//
//

import Foundation
import Vapor
import Fluent

class Chat: Model {

    var id: Node?
    var chatId: String
    var counter: Int

    init(chatId: String, counter: Int) {
        self.chatId = chatId
        self.counter = counter
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "chat_id": chatId,
            "counter": counter
            ])
    }

    required init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        chatId = try node.extract("chat_id")
        counter = try node.extract("counter")
    }
}

extension Chat {

    static func prepare(_ database: Database) throws {
        try database.create("chats") { chats in
            chats.id()
            chats.string("chat_id")
            chats.int("counter")
        }
    }

    static func revert(_ database: Database) throws {
        try database.delete("chats")
    }
}
