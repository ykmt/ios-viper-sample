// Person.swift

/// Person
///
/// `Presenter`が参照できるモデルです。
///
/// `Presenter`は`Entity`を参照できないので、プロトコル経由で参照します。

protocol Person {
    var firstName: String { get set }
    var lastName: String { get set }
    var fullName: String { get }
    var age: Int { get set }
}

/// PersonEntity
///
/// `VIPER`で定義される`Entity`です。

struct PersonEntity: Person {

    var firstName: String
    var lastName: String
    var fullName: String {
        return lastName + " " + firstName
    }
    var age: Int

    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func greeting() {
        print("My name is " + fullName + ".")
    }
}
