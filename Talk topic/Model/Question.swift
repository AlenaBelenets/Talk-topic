//
//  Question.swift
//  Talk topic
//
//  Created by Alena Belenets on 09.11.2022.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    let title: String
    let type: Relationships
}
enum Relationships {
    case closeFriends, business, stranger
}
