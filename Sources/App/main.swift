import Vapor
import VaporMySQL

let drop = Droplet()

// Add MySQL to providers list
try drop.addProvider(VaporMySQL.Provider.self)

drop.preparations.append(Chat.self)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

let telegramController = TelegramController()

drop.post("telegram", handler: telegramController.telegramBaseRequest)

drop.resource("posts", PostController())

drop.run()
