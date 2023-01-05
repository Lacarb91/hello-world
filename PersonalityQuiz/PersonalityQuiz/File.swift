//
//  File.swift
//  PersonalityQuiz
//
//  Created by Lana Carbone on 31/12/2022.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: FoodType
}

enum FoodType: Character {
    case meat = "🥩" , prawn = "🍤" , salad = "🥗" , dessert = "🧁"

var definition: String {
    switch self {
        case .meat:
            return " You are strong and energetic. You prefer to do things on your own and for yourself, but you are also warm and generous to those you love. You have a mischievous side."
        case .prawn:
            return "You are outgoing and enjoy the company of others. You surround yourself with people you love and enjoy activities with friends and family."
        case .salad:
            return "You like to take care of your health. You enjoy activities that are out in nature, and you love to explore and try new things. You are calm and gentle."
        case .dessert:
            return "You love to have fun. You like variety in your life and get bored with the routine and mundane, prefering some excitement and novelty. You are curious and creative."
        }
}
    }
