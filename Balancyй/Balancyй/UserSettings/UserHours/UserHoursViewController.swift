//
//  UserHoursViewController.swift
//  Balancy
//
//  Created by Oleksandr on 17.09.2024.
//

import UIKit
import SwiftUI

final class UserHoursViewController: UIViewController {
    
    // Properties
    
    private let userPreferenceManager: UserPreferenceManager
    
    private let hoursArray = Array(1...24)
    private let minutesArray = Array(0...59)
    
    private var selectedHour: Int = 1
    private var selectedMinute: Int = 0
    
    private var isTimeSet: Bool = false
    
    // UI
    
    private let logoImageView = UIImageView()
    
    private let selectHoursLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.regular, size: 24)
        label.textColor = AppColor.textWhite
        label.numberOfLines = 0
        return label
    }()
    
    private let hoursPerHourLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.light, size: 16)
        label.textColor = AppColor.textPrimary
        return label
    }()
    
    private let hoursLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontName.ultraLight, size: 10)
        label.textColor = AppColor.textPrimary
        return label
    }()
    
    private lazy var pickerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.backgroundSecondary
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let timePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = AppColor.backgroundSecondary
        picker.layer.cornerRadius = 20
        picker.clipsToBounds = true
        picker.isHidden = true
        return picker
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 2
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private let runButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.textWhite, for: .normal)
        button.titleLabel?.font = UIFont(name: FontName.medium, size: 16)
        button.backgroundColor = AppColor.accentMagenta
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setDisabled()
        return button
    }()
    
    // Initialize
    
    init(userPreferenceManager: UserPreferenceManager) {
        self.userPreferenceManager = userPreferenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateWithData()
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    // UI Configuration
    
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundDefault
        view.addSubviews(logoImageView, selectHoursLabel, pickerContainerView, timePicker, pageControl, runButton)
        pickerContainerView.addSubview(hoursPerHourLabel, applyConstraints: false)
        pickerContainerView.addSubview(hoursLabel, applyConstraints: false)
        
        pickerContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPicker)))
        
        navigationController?.navigationBar.tintColor = .label
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapReturnButton))
        
        setConstraints()
        setupRunButton()
    }
    
    private func populateWithData() {
        logoImageView.image = UIImage(named: ImageName.logo)
        selectHoursLabel.text = Localized.selectHours.localizedString
        hoursLabel.text = Localized.hours.localizedString
        hoursPerHourLabel.text = Localized.hoursPerHour.localizedString
        runButton.setTitle(Localized.runButton.localizedString, for: .normal)
    }
    
    private func presentChooseColorViewController() {
        let chooseColorViewController = ChooseColorViewController()
        let navController = UINavigationController(rootViewController: chooseColorViewController)
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        present(navController, animated: true)
    }
    
    private func saveTime() {
        userPreferenceManager.saveTime(hour: selectedHour, minute: selectedMinute)
    }
    
    @objc private func didTapReturnButton() {
        navigationController?.popViewController(animated: true)
    }
    
    private func runButtonTapped() {
        saveTime()
        presentChooseColorViewController()
    }
    
    private func setupRunButton() {
        mapButton(runButton) { [weak self]  in
            self?.runButtonTapped()
        }
    }
    
    @objc private func showPicker() {
        timePicker.isHidden = false
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        if !timePicker.isHidden {
            hidePicker()
        }
    }
    
    @objc private func hidePicker() {
        timePicker.isHidden = true
    }
}

// Constraints

private extension UserHoursViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.11),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.39),
            
            selectHoursLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            selectHoursLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            selectHoursLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            pickerContainerView.topAnchor.constraint(equalTo: selectHoursLabel.bottomAnchor, constant: 20),
            pickerContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pickerContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pickerContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            pickerContainerView.heightAnchor.constraint(equalTo: pickerContainerView.widthAnchor, multiplier: 0.146),
            
            hoursPerHourLabel.centerYAnchor.constraint(equalTo: pickerContainerView.centerYAnchor),
            hoursPerHourLabel.leadingAnchor.constraint(equalTo: pickerContainerView.leadingAnchor, constant: 16),
            
            hoursLabel.centerYAnchor.constraint(equalTo: pickerContainerView.centerYAnchor),
            hoursLabel.trailingAnchor.constraint(equalTo: pickerContainerView.trailingAnchor, constant: -16),
            
            pageControl.topAnchor.constraint(equalTo: runButton.topAnchor, constant: -30),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            runButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            runButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            runButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            runButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            timePicker.topAnchor.constraint(equalTo: pickerContainerView.bottomAnchor),
            timePicker.leadingAnchor.constraint(equalTo: pickerContainerView.leadingAnchor),
            timePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.47),
            timePicker.heightAnchor.constraint(equalTo: timePicker.widthAnchor, multiplier: 1.16)
        ])
    }
}

// Picker methods

extension UserHoursViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHour = hoursArray[pickerView.selectedRow(inComponent: 0)]
        
        if selectedHour == 24 {
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
        
        pickerView.reloadComponent(1)
        
        selectedMinute = minutesArray[pickerView.selectedRow(inComponent: 1)]
        hoursLabel.text = String(format: "%02d:%02d", selectedHour, selectedMinute)
        
        isTimeSet = true
        
        if isTimeSet {
            runButton.setEnabled()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hoursArray.count
        } else {
            let selectedHour = hoursArray[pickerView.selectedRow(inComponent: 0)]
            return selectedHour == 24 ? 1 : minutesArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(hoursArray[row])"
        } else {
            return String(format: "%02d", minutesArray[row])
        }
    }
}

// Preview

#Preview {
    UserHoursViewController.preview
}
