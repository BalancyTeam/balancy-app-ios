//
//  TaskType.swift
//  Balancy
//
//  Created by Tobias on 28.07.2024.
//

import Foundation

enum TaskCategory: CaseIterable {
    case all
    case work
    case life
    case learning
    
    var title: String {
        switch self {
        case .all:
            Localized.allTasks.localizedString
        case .work:
            Localized.workTasks.localizedString
        case .life:
            Localized.lifeTasks.localizedString
        case .learning:
            Localized.learningTasks.localizedString
        }
    }
}
