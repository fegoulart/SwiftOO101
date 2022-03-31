// Alice class implements Person Protocol
final class Alice: Person {

    weak var friend: Person?

    // MARK: - Person Protocol Implementation

    func send(
        message: String
    ) {
        friend?.receive(
            message: message,
            from: self
        )
    }

    func receive(
        message: String,
        from person: Person
    ) {
        print("Message from \(type(of:person)): \n\(message)")
    }
}

// Bob class implements Person Protocol
final class Bob: Person {

    var friend: Alice

    // Constructor
    init(
        friend: Alice
    ) {
        self.friend = friend
    }

    // MARK: - Person Protocol Implementation

    func send(
        message: String
    ) {
        friend.receive(
            message: message,
            from: self
        )
    }

    func receive(
        message: String,
        from person: Person
    ) {
        print("Message from \(type(of:person)): \n\(message)")
    }
}


let alice = Alice()
let bob = Bob(friend: alice)
alice.friend = bob

alice.send(message: "Hello Bob. Here is Alice.")
bob.send(message: "Hello Alice ! How's your day ?")

// Protocol (Java calls it Interface)
protocol Person: AnyObject {
    func send(message: String)
    func receive(message: String, from person: Person)
}
