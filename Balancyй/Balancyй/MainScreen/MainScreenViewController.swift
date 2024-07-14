//
//  MainScreenViewController.swift
//  Balancy
//
//  Created by Tobias on 06.07.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private let calendarView: CalendarView = .init()
    
    private var selectedDate: Date = .now.normalizedByDay
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainScreenViewController {
    private enum Size {
        static let calendar: CGFloat = 61
    }
    
    private enum Offset {
        static let calendarHOffset: CGFloat = 24
        static let calendarTopOffset: CGFloat = 15
    }
    
    func setupUI() {
        view.addSubviews(calendarView)
        
        setupConstraints()
        setupCalendar()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Offset.calendarTopOffset),
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Offset.calendarHOffset),
            calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Offset.calendarHOffset),
            calendarView.heightAnchor.constraint(equalToConstant: Size.calendar)
        ])
    }
    
    func setupCalendar() {
        calendarView.configure(selectedDate) { [weak self] date in
            self?.selectedDate = date
        }
    }
}
