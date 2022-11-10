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

    static func getQuestion() -> [Question] {
        [
            Question(
            title: "What is the style of your meeting?",
            type: .single,
            answers: [
                Answer(title: "Business", type: .business),
                Answer(title: "Romantic", type: .romantic),
                Answer(title: "Stranger", type: .stranger)
            ]
        ),
         Question(
            title: "What topic of conversation do you prefer?",
            type: .single,
            answers: [
                Answer(title: "Joke", type: .business),
                Answer(title: "Introduce yourself", type: .romantic),
                Answer(title: "Small talk", type: .stranger)
            ]
         ),
         Question(
            title: "What topic of conversation do you prefer?",
            type: .single,
            answers: [
                Answer(title: "Joke", type: .business),
                Answer(title: "Compliment", type: .romantic),
                Answer(title: "Small talk", type: .stranger)
            ]
         ),
         Question(
            title: "Do you like to talk about yourself?",
            type: .single,
            answers: [
                Answer(title: "I don't like", type: .business),
                Answer(title: "I take it easy", type: .stranger),
                Answer(title: "I love it", type: .romantic)
            ]
         )
        ]

    }
}


enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    let title: String
    let type: Relationships
}

enum Relationships {
    case stranger, business, romantic

    var definition: String {
        switch self {
        case .business:
            return "Hobbies and interests. Do you like sports, reading, drawing? Tell me about it."
        case .romantic:
            return "Tell about your adventures and funny stories. Each of us has a couple of stories that can make a crowd of people laugh. Remember and tell!"
        case .stranger:
            return "Tell us about your preferences in movies, music or TV shows. a banal topic for conversation, but it helps to get to know a stranger better. Share your musical preferences, exchange books, suggest a movie for the evening."
        }
    }
}

