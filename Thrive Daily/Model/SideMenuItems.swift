//
//  SideMenu.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-16.
//

import SwiftUI

//This code is to be able to associate a view
//into a variable
protocol Component {
    associatedtype Body: View
    
    var view: Body {get}
}

enum SideMenuItems: String, Component, CaseIterable, Identifiable {
    case /*notes,*/ quotes, journal, habits, addiction, goals, favourites, settings
    
    var id: String {self.rawValue}
    
    var title: String {
        switch self {
//        case .notes:
//            "Notes"
        case .quotes:
            "Quotes"
        case .journal:
            "Journal"
        case .habits:
            "Habits"
        case .addiction:
            "Addiction(s)"
        case .goals:
            "Goals"
        case .favourites:
            "Favourites"
        case .settings:
            "Settings"
        }
    }
    
    var imageName: String {
        switch self {
//        case .notes:
//            "square.and.pencil"
        case .quotes:
            "bubble"
        case .journal:
            "note.text"
        case .habits:
            "bicycle"
        case .addiction:
            "person.fill.xmark"
        case .goals:
            "figure.outdoor.cycle"
        case .favourites:
            "heart"
        case .settings:
            "gearshape"
        }
    }
    
    var view: AnyView {
        switch self {
//        case .notes: AnyView(Notes())
        case .quotes: AnyView(Quotes())
        case .journal: AnyView(Journal())
        case .habits: AnyView(Habits())
        case .addiction: AnyView(Addiction())
        case .goals: AnyView(Goals())
        case .favourites: AnyView(Favourites())
        case .settings: AnyView(Settings())
        }
    }
}
