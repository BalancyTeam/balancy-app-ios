//
//  CalendarView.swift
//  Balancy
//
//  Created by Tobias on 14.07.2024.
//

import Foundation
import UIKit

final class CalendarView: UIView {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Size.itemWidth, height: Size.itemHeight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 22
        layout.scrollDirection = .horizontal
        let collection: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    private var selectedDate: Date?
    private var onSelectDate: ((Date) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ date: Date?, onSelectDate: @escaping (Date) -> Void) {
        selectedDate = date
        collectionView.reloadData()
        self.onSelectDate = onSelectDate
    }
}

private extension CalendarView {
    private enum Size {
        static let itemWidth: CGFloat = 30
        static let itemHeight: CGFloat = 60
    }
    
    func setupUI() {
        addSubviews(collectionView)
        
        setupConstraints()
        setupCollection()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupCollection() {
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: CellIdentifiers.calendar)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 365
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.calendar, for: indexPath) as! CalendarCell
        let date: Date = .now
        let calendar = Calendar.current
        let components = DateComponents(day: indexPath.row)
        let newDate = calendar.date(byAdding: components, to: date)!.normalizedByDay
        cell.setupDate(newDate)
        cell.setupSelected(selectedDate == newDate)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarCell else {
            return
        }
        
        self.selectedDate = cell.date
        self.collectionView.reloadData()
        
        guard let date = cell.date else { return }
        self.onSelectDate?(date)
    }
}
