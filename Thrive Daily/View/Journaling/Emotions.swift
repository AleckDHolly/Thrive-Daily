//
//  JournalQuestions.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-18.
//

import Foundation

enum Emotions: String, CaseIterable, Identifiable {
    case happiness, sadness, anger, concerned, neutral,
         excitement, love, gratitude, boredom, hope, guilt
    
    var id: String { self.rawValue }
    
    var emoji: String {
        switch self {
        case .happiness:
            "😀"
        case .sadness:
            "😢"
        case .anger:
            "😡"
        case .concerned:
            "😨"
        case .excitement:
            "😃"
        case .neutral:
            "😐"
        case .love:
            "🥰"
        case .gratitude:
            "🙏"
        case .boredom:
            "😴"
        case .hope:
            "🌟"
        case .guilt:
            "😔"
        }
    }
    
    var emotion: String {
        switch self {
        case .happiness:
            "Happy"
        case .sadness:
            "Sad"
        case .anger:
            "Angry"
        case .concerned:
            "Concerned"
        case .excitement:
            "Excited"
        case .neutral:
            "Neutral"
        case .love:
            "In Love"
        case .gratitude:
            "Grateful"
        case .boredom:
            "Bored"
        case .hope:
            "Hopeful"
        case .guilt:
            "Guilty"
        }
    }
    
    var questions: [String] {
        switch self {
        case .happiness:
            [
                "Event or achievement that made you happy today?",
                "How to replicate or extend this happiness?",
                "Contributors to your happiness?",
                "Activities or hobbies that brought you joy?",
                "Reflection on what happiness means to you?"
            ]
        case .sadness:
            [
                "Event or circumstance triggering sadness today?",
                "Typical coping mechanisms for sadness?",
                "Patterns or recurring themes in sadness?",
                "Actions or activities to improve mood?",
                "Consider discussing feelings with someone you trust."
            ]
        case .anger:
            [
                "Specific event or situation triggering anger today?",
                "Typical reactions or expressions of anger?",
                "Strategies or techniques to manage anger?",
                "Thoughts or beliefs contributing to anger?",
                "Activities or practices to calm down when angry."
            ]
        case .concerned:
            [
                "Specific concerns or worries on your mind?",
                "How do these concerns affect mood or behavior?",
                "Steps to address or alleviate concerns?",
                "Underlying reasons or past experiences contributing to worries?",
                "Potential positive outcomes or solutions to concerns."
            ]
        case .excitement:
            [
                "Events or plans causing excitement?",
                "Physical sensations or reactions to excitement?",
                "Sharing excitement with others?",
                "Long-term goals related to exciting events?",
                "Ways to savor and prolong excitement?"
            ]
        case .neutral:
            [
                "Describe how you feel when neutral.",
                "Reflection on the concept of neutrality?",
                "Advantages or disadvantages of feeling neutral?",
                "Typical response or behavior in a neutral state?",
                "Consideration of neutrality in decision-making."
            ]
        case .love:
            [
                "Who do you love?",
                "How do you express your love?",
                "What does love mean to you?",
                "How does love affect your life?",
                "What can you do to show more love?"
            ]
        case .gratitude:
            [
                "What are you grateful for today?",
                "Who has positively impacted your life?",
                "How do you express gratitude?",
                "What does gratitude mean to you?",
                "How can you practice more gratitude in your daily life?"
            ]
        case .boredom:
            [
                "When do you feel most bored?",
                "How do you usually cope with boredom?",
                "What activities can help reduce your boredom?",
                "What can you learn from feeling bored?",
                "How can you turn boredom into a positive experience?"
            ]
        case .hope:
            [
                "What are you hopeful for?",
                "How does hope affect your outlook on life?",
                "Who or what gives you hope?",
                "How can you cultivate more hope?",
                "What are some goals or dreams that you are hopeful about?"
            ]
        case .guilt:
            [
                "What made you feel guilty today?",
                "How do you usually deal with guilt?",
                "Is there a pattern to your feelings of guilt?",
                "What can you do to forgive yourself?",
                "How can you make amends for the things you feel guilty about?"
            ]
        }
    }
}
