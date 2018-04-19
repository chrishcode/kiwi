import Vapor

final class UserController {
    /// Returns a list of all Users.
    func index(_ req: Request) throws -> Future<[User]> {
        return req.withConnection(to: .mysql) { db -> Future<[User]> in
            return db.query(User.self).all()
        }
    }

    /// Saves a decoded User to the database.
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap(to: User.self) { user in
            return user.save(on: req)
        }
    }
}
