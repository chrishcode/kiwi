// import JWT
// import Vapor

// struct JWTConfig {
//   static let signerKey = "yourSignerKeyHere" 
//   static let headers = JSON(["typ": "JWT", "alg": "HS256"])
//   static let signer = HS256(key: JWTConfig.signerKey.bytes)
//   static let expirationTime: Int = 1000
// }

// class TokenHelpers {
//     class func createPayload(from user: User) throws -> JSON {
//         if let id = user.id {
//             let now = Date()
//             let dateAsTimeDouble = now.timeIntervalSince1970
//             let createdAt:Int = Int(dateAsTimeDouble)
//             let expiration = Int(dateAsTimeDouble) + JWTConfig.expirationTime
//             let payLoad = JSON([
//                 "iss": "kiwi", 
//                 "iat": .number(.int(createdAt)), 
//                 "userEmail": .string(user.email), 
//                 "userId": .number(.int(id)), 
//                 "exp": .number(.int(expiration))
//             ])
//             return payLoad
//         } else { throw JWTError(identifier: "createPayload", reason: "User has no id.") }
//     }

//     class func createJwt(from user: User) throws -> String { // (1)
//         do {
//             let payLoad = try TokenHelpers.createPayload(from: user) // (2)
//             let headers = JWTConfig.headers
//             let signer = JWTConfig.signer
//             let jwt = try JWT(headers: headers, payload: payLoad, signer: signer) // (3)
//             let token = try jwt.createToken() // (4)
//             return token
//         } catch { throw JWTError(identifier: "createJwt", reason: "Token could not be created.") }
//     }
// }
