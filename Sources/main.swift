import Foundation
import Kitura
import HeliumLogger
import LoggerAPI
import SwiftyJSON

// disable buffering

Log.logger = HeliumLogger()

let router = Router()

router.get("/"){ request, response, next in
    response.status(.OK).send(json: JSON( ["Hello": "Kitura"]  ) )
    next()
    
}

Log.info("Starting the server")

Kitura.addHTTPServer(onPort: 8090, with: router)

Kitura.run()

