//
//  Page.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-15.
//

import Foundation

struct Page: Identifiable, Equatable {
    var id = UUID()
    var title: String?
    var phrase: String
    var lottie: String
}

let pages: [Page] = [
    Page(title: "Welcome", phrase: "Welcome to Self-Improvement", lottie: "welcome.json"),
    Page(title: "Notes", phrase: "Capture Your Thoughts with Notes", lottie: "notes.json"),
    Page(title: "Quotes", phrase: "Stay Inspired with Quotes", lottie: "legendary2.json"),
    Page(title: "Journal", phrase: "Reflect and Grow with Journaling", lottie: "book.json"),
    Page(title: "Habits", phrase: "Stay Productive with Habit Tracking", lottie: "calendar.json"),
    Page(title: "Addiction(s)", phrase: "Rise Above: Defeat Your Addictions", lottie: "addiction.json"),
    Page(title: "Goals", phrase: "Set and Achieve Your Goals", lottie: "goal.json"),
    Page(title: "Favourites", phrase: "Organize Your Inspiration with Favourites", lottie: "fav.json"),
    Page(phrase: "Let's Start Your Self-Improvement Journey", lottie: "start.json")
]
