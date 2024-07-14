//
//  CalendarCell.swift
//  Balancy
//
//  Created by Tobias on 14.07.2024.
//

import UIKit

enum CellIdentifiers {
    static let calendar: String = "CalendarCell"
}

final class CalendarCell: UICollectionViewCell {
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private(set) var date: Date?
    private var dateSelected: Bool = false
    
    override var reuseIdentifier: String? { CellIdentifiers.calendar }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDate(_ date: Date) {
        self.date = date
        dateLabel.text = date.dayDate
        dayLabel.text = date.weekDay
    }
    
    func setupSelected(_ isSelected: Bool) {
        dateSelected = isSelected
        updateState()
    }
}

private extension CalendarCell {
    private enum Size {
        static let width: CGFloat = 30
        static let height: CGFloat = 30
    }
    
    func setupUI() {
        addSubviews(dateLabel,dayLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: Size.width),
            dayLabel.topAnchor.constraint(equalTo: topAnchor),
            dayLabel.heightAnchor.constraint(equalToConstant: Size.height),
            
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: Size.width),
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: Size.height),
        ])
    }
    
    func updateState() {
        //TODO: Setup colors after merge
        dayLabel.textColor = dateSelected ? .white : .gray
        dayLabel.font = UIFont(name: dateSelected ? FontName.medium : FontName.light, size: 12)
        
        dateLabel.textColor = dateSelected ? .white : .gray
        dateLabel.font = UIFont(name: dateSelected ? FontName.medium : FontName.light, size: 22)
    }
}
